package employee.manager;

import java.util.List;

import employee.dao.CareerDAO;
import employee.dao.EmployeeDAO;
import employee.dao.SkillsetDAO;
import employee.entity.Career;
import employee.entity.Employee;
import employee.entity.Skillset;

public class EmployeeManagerImpl implements EmployeeManager {
	private EmployeeDAO employeeDAO;
	private SkillsetDAO skillsetDAO;
	private CareerDAO careerDAO;

	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	public SkillsetDAO getSkillsetDAO() {
		return skillsetDAO;
	}

	public void setSkillsetDAO(SkillsetDAO skillsetDAO) {
		this.skillsetDAO = skillsetDAO;
	}

	public CareerDAO getCareerDAO() {
		return careerDAO;
	}

	public void setCareerDAO(CareerDAO careerDAO) {
		this.careerDAO = careerDAO;
	}

	@Override
	public Integer addEmployee(Employee employee) {
		return employeeDAO.addEmployee(employee);
	}

	@Override
	public void updateEmployee(Employee employee) {
		employeeDAO.updateEmployee(employee);
	}

	@Override
	public void deleteEmployee(Integer id) {
		employeeDAO.deleteEmployee(id);
	}

	@Override
	public List<Employee> listEmployee() {
		return employeeDAO.listEmployee();
	}

	@Override
	public Employee findEmployeeById(Integer id) {
		Employee employee = employeeDAO.findEmployeeById(id);
		return employee;
	}

	@Override
	public Integer addSkillset(Skillset skillset) {
		return skillsetDAO.addSkillset(skillset);
	}

	@Override
	public void updateSkillset(Skillset skillset) {
		skillsetDAO.updateSkillset(skillset);
	}

	@Override
	public void deleteSkillset(Integer id) {
		skillsetDAO.deleteSkillset(id);
	}

	@Override
	public Skillset findSkillsetById(Integer id) {
		return skillsetDAO.findSkillsetById(id);
	}

	@Override
	public Integer addCareer(Career career) {
		return careerDAO.addCareer(career);
	}

	@Override
	public void updateCareer(Career career) {
		careerDAO.updateCareer(career);
	}

	@Override
	public void deleteCareer(Integer id) {
		careerDAO.deleteCareer(id);
	}

	@Override
	public Career findCareerById(Integer id) {
		return careerDAO.findCareerById(id);
	}

	@Override
	public List<Employee> searchForEmployee(String searchText, String searchIn,
			String sortBy, int pageNum, int pageSize) {
		return employeeDAO.searchForEmployee(searchText, searchIn, sortBy,
				pageNum, pageSize);
	}

	@Override
	public List<Integer> searchForEmployeePagination(String searchText,
			String searchIn, int pageSize) {
		return employeeDAO.searchForEmployeePagination(searchText, searchIn,
				pageSize);
	}

	@Override
	public List<String> searchForEmployeeAutocomplete(String searchText) {
		return employeeDAO.searchForEmployeeAutocomplete(searchText);
	}

}
