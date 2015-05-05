package employee.dao;

import java.util.List;

import employee.entity.Employee;

public interface EmployeeDAO {
	Integer addEmployee(Employee employee);

	void updateEmployee(Employee employee);

	void deleteEmployee(Integer id);

	List<Employee> listEmployee();

	Employee findEmployeeById(Integer id);

	List<Employee> employeePagination(int pageNum, int pageSize);

	List<Integer> employeePaginationCount(int pageSize);

	List<Employee> searchForEmployee(String searchText, String searchIn,
			String sortBy, int pageNum, int pageSize);

	List<Integer> searchForEmployeePagination(String searchText,
			String searchIn, int pageSize);

	List<String> searchForEmployeeAutocomplete(String searchText);
}
