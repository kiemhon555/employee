package employee.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.hibernate.transform.DistinctRootEntityResultTransformer;
import org.springframework.transaction.annotation.Transactional;

import employee.entity.Employee;

public class EmployeeDAOImpl implements EmployeeDAO {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public Integer addEmployee(Employee employee) {
		Integer id = -1;
		id = (Integer) sessionFactory.getCurrentSession().save(employee);
		return id;
	}

	@Override
	@Transactional
	public List<Employee> listEmployee() {
		List<Employee> employees = null;
		employees = sessionFactory.getCurrentSession()
				.createQuery("FROM Employee").list();
		return employees;
	}

	@Override
	@Transactional
	public void updateEmployee(Employee employee) {
		sessionFactory.getCurrentSession().update(employee);
	}

	@Override
	@Transactional
	public void deleteEmployee(Integer id) {
		Employee employee = (Employee) sessionFactory.getCurrentSession().load(
				Employee.class, id);

		if (null != employee)
			sessionFactory.getCurrentSession().delete(employee);
	}

	@Override
	@Transactional
	public Employee findEmployeeById(Integer id) {
		Employee employee = null;
		employee = (Employee) sessionFactory.getCurrentSession().get(
				Employee.class, id);
		return employee;
	}

	@Transactional
	private Criteria search(String searchText, String searchIn) {
		boolean parsable = true;
		try {
			Integer.parseInt(searchText);
		} catch (Exception e) {
			searchText = "%" + searchText + "%";
			parsable = false;
		}
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(
				Employee.class);

		if ("name".equalsIgnoreCase(searchIn)) {
			crit.add(Restrictions.like("fullname", searchText));
		} else {
			crit.createAlias("skillsetList", "skillset");
			crit.createAlias("careerList", "career");
			if ("years".equalsIgnoreCase(searchIn) && parsable) {
				crit.add(Restrictions.eq("skillset.experiencedYears",
						Integer.parseInt(searchText)));
			} else if ("tech".equalsIgnoreCase(searchIn)) {
				Criterion tech_skillset = Restrictions.like(
						"skillset.technology", searchText);
				Criterion tech_career = Restrictions.like("career.technology",
						searchText);
				crit.add(Restrictions.or(tech_skillset, tech_career));
			} else if ("project".equalsIgnoreCase(searchIn)) {
				crit.add(Restrictions.like("career.project", searchText));
			} else {
				crit.add(Restrictions.like("career.description", searchText));
			}
		}
		crit.setResultTransformer(DistinctRootEntityResultTransformer.INSTANCE);
		return crit;
	}

	@Override
	@Transactional
	public List<Employee> searchForEmployee(String searchText, String searchIn,
			String sortBy, int pageNum, int pageSize) {
		List<Employee> employees = null;
		Criteria crit = this.search(searchText, searchIn);
		if (!"".equalsIgnoreCase(sortBy)) {
			if ("nameAsc".equalsIgnoreCase(sortBy)) {
				crit.addOrder(Order.asc("fullname"));
			} else if ("nameDesc".equalsIgnoreCase(sortBy)) {
				crit.addOrder(Order.desc("fullname"));
			}
		}
		crit.setFirstResult((pageNum - 1) * pageSize);
		crit.setMaxResults(pageSize);
		employees = crit.list();
		return employees;
	}

	@Override
	@Transactional
	public List<Integer> searchForEmployeePagination(String searchText,
			String searchIn, int pageSize) {
		List<Integer> pages = new ArrayList<>();
		Criteria crit = this.search(searchText, searchIn);
		crit.setProjection(Projections.rowCount());
		Long count = (Long) crit.uniqueResult();
		double pageCount = (double) count / pageSize;

		for (int i = 0; i < Math.ceil(pageCount); i++) {
			pages.add(i + 1);
		}
		return pages;
	}

	@Override
	@Transactional
	public List<String> searchForEmployeeAutocomplete(String searchText) {
		List<String> names = new ArrayList<>();
		Criteria crit = this.search(searchText, "name");
		List<Employee> employeeList = crit.list();
		for (Employee employee : employeeList) {
			names.add(employee.getFullname());
		}
		return names;
	}

}
