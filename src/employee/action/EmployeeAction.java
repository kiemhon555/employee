package employee.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import employee.manager.EmployeeManager;
import employee.entity.Employee;

public class EmployeeAction extends ActionSupport implements
		ModelDriven<Employee> {

	private Employee employee;
	private List<Employee> employeeList;
	private EmployeeManager employeeManager;

	@Override
	public Employee getModel() {
		return employee;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Employee> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(List<Employee> employeeList) {
		this.employeeList = employeeList;
	}

	public EmployeeManager getEmployeeManager() {
		return employeeManager;
	}

	public void setEmployeeManager(EmployeeManager employeeManager) {
		this.employeeManager = employeeManager;
	}

	public String addEmployee() {
		employeeManager.addEmployee(employee);
		return "success";
	}

	@SkipValidation
	public String editEmployee() {
		employee = employeeManager.findEmployeeById(employee.getId());
		return "success";
	}

	public String updateEmployee() {
		employeeManager.updateEmployee(employee);
		return "success";
	}

	@SkipValidation
	public String deleteEmployee() {
		employeeManager.deleteEmployee(employee.getId());
		return "success";
	}

	@SkipValidation
	public String listEmployees() {
		employeeList = employeeManager.listEmployee();
		return "success";
	}

}
