package employee.manager;

import java.util.List;

import employee.entity.Career;
import employee.entity.Employee;
import employee.entity.Skillset;

public interface EmployeeManager {
	Integer addEmployee(Employee employee);

	void updateEmployee(Employee employee);

	void deleteEmployee(Integer id);

	List<Employee> listEmployee();

	Employee findEmployeeById(Integer id);

	List<Employee> searchForEmployee(String searchText, String searchIn,
			String sortBy, int pageNum, int pageSize);

	List<Integer> searchForEmployeePagination(String searchText,
			String searchIn, int pageSize);

	List<String> searchForEmployeeAutocomplete(String searchText);

	Integer addSkillset(Skillset skillset);

	void updateSkillset(Skillset skillset);

	void deleteSkillset(Integer id);

	Skillset findSkillsetById(Integer id);

	Integer addCareer(Career career);

	void updateCareer(Career career);

	void deleteCareer(Integer id);

	Career findCareerById(Integer id);
}
