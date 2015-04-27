package employee.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import employee.entity.Skillset;

public class SkillsetDAOImpl implements SkillsetDAO {

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
	public Integer addSkillset(Skillset skillset) {
		Integer id = -1;
		id = (Integer) sessionFactory.getCurrentSession().save(skillset);
		return id;
	}

	@Override
	@Transactional
	public void updateSkillset(Skillset skillset) {
		sessionFactory.getCurrentSession().update(skillset);
	}

	@Override
	@Transactional
	public void deleteSkillset(Integer id) {
		Skillset skillset = (Skillset) sessionFactory.getCurrentSession().load(
				Skillset.class, id);

		if (null != skillset)
			sessionFactory.getCurrentSession().delete(skillset);
	}

	@Override
	@Transactional
	public List<Skillset> listSkillsetByEmployee(Integer empId) {
		hql = "FROM Skillset S WHERE S.employeeId = :employee_id";
		query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("employee_id", empId);

		List<Skillset> skillsets = null;
		skillsets = query.list();
		return skillsets;
	}

	@Override
	@Transactional
	public Skillset findSkillsetById(Integer id) {
		Skillset skillset = null;
		skillset = (Skillset) sessionFactory.getCurrentSession().get(
				Skillset.class, id);
		return skillset;
	}
}
