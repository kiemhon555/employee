package employee.dao;

import java.util.List;

import employee.entity.Skillset;

public interface SkillsetDAO {
	Integer addSkillset(Skillset skillset);

	void updateSkillset(Skillset skillset);

	void deleteSkillset(Integer id);

	List<Skillset> listSkillsetByEmployee(Integer empId);

	Skillset findSkillsetById(Integer id);
}
