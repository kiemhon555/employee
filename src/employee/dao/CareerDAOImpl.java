package employee.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import employee.entity.Career;

public class CareerDAOImpl implements CareerDAO {

	private SessionFactory sessionFactory;
	private String hql;
	private Query query;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public Integer addCareer(Career career) {
		Integer id = -1;
		id = (Integer) sessionFactory.getCurrentSession().save(career);
		return id;
	}

	@Override
	@Transactional
	public void updateCareer(Career career) {
		sessionFactory.getCurrentSession().update(career);
	}

	@Override
	@Transactional
	public void deleteCareer(Integer id) {
		Career career = (Career) sessionFactory.getCurrentSession().load(
				Career.class, id);
		if (null != career)
			sessionFactory.getCurrentSession().delete(career);
	}

	@Override
	@Transactional
	public List<Career> listCareerByEmployee(Integer empId) {
		hql = "FROM Career C WHERE C.employeeId = :employee_id";
		query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("employee_id", empId);

		List<Career> careers = null;
		careers = query.list();
		return careers;
	}

	@Override
	@Transactional
	public Career findCareerById(Integer id) {
		Career career = null;
		career = (Career) sessionFactory.getCurrentSession().get(Career.class,
				id);
		return career;
	}

}
