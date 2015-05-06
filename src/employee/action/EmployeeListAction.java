package employee.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import employee.entity.Employee;
import employee.manager.EmployeeManager;

public class EmployeeListAction extends ActionSupport implements
		ModelDriven<Employee> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Employee employee;
	private List<Employee> employeeList;
	private EmployeeManager employeeManager;

	private String searchText;
	private String searchIn;
	private String sortBy;

	private List<Integer> pages;
	private int pageNum;
	private int pageSize;

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

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getSearchIn() {
		return searchIn;
	}

	public void setSearchIn(String searchIn) {
		this.searchIn = searchIn;
	}

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public List<Integer> getPages() {
		return pages;
	}

	public void setPages(List<Integer> pages) {
		this.pages = pages;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public Employee getModel() {
		return employee;
	}

	public String listEmployees() {
		pageNum = 1;
		pageSize = 5;
		pages = employeeManager.employeePaginationCount(pageSize);
		employeeList = employeeManager.employeePagination(pageNum, pageSize);
		return "success";
	}

	public String paginationEmployee() {
		employeeList = employeeManager.employeePagination(pageNum, pageSize);
		return "success";
	}

	public String searchEmployeeTo() {
		return "success";
	}

	public String searchEmployee() {
		pageNum = 1;
		pageSize = 2;
		pages = employeeManager.searchForEmployeePagination(searchText,
				searchIn, pageSize);
		if (!"".equalsIgnoreCase(searchText)) {
			employeeList = employeeManager.searchForEmployee(searchText,
					searchIn, sortBy, pageNum, pageSize);
			return "success";
		} else {
			return Action.NONE;
		}
	}

	public String searchAutocomplete() {
		pageNum = 1;
		pageSize = 2;
		searchIn = "name";
		pages = employeeManager.searchForEmployeePagination(searchText,
				searchIn, pageSize);
		if (!"".equalsIgnoreCase(searchText)) {
			employeeList = employeeManager.searchForEmployee(searchText,
					searchIn, sortBy, pageNum, pageSize);
			return "success";
		} else {
			return Action.NONE;
		}
	}

	public String paginationSearchEmployee() {
		employeeList = employeeManager.searchForEmployee(searchText, searchIn,
				sortBy, pageNum, pageSize);
		return "success";
	}
}
