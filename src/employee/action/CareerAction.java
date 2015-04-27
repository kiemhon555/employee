package employee.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import employee.entity.Career;
import employee.manager.EmployeeManager;

public class CareerAction extends ActionSupport implements ModelDriven<Career> {

	private Career career;
	private List<Career> careerList;
	private EmployeeManager employeeManager;

	private int empId;
	private String startDate, endDate;

	private SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

	@Override
	public Career getModel() {
		return career;
	}

	public Career getCareer() {
		return career;
	}

	public void setCareer(Career career) {
		this.career = career;
	}

	public List<Career> getCareerList() {
		return careerList;
	}

	public void setCareerList(List<Career> careerList) {
		this.careerList = careerList;
	}

	public EmployeeManager getEmployeeManager() {
		return employeeManager;
	}

	public void setEmployeeManager(EmployeeManager employeeManager) {
		this.employeeManager = employeeManager;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@SkipValidation
	public String addPrepareCareer() {
		career.setEmployee(employeeManager.findEmployeeById(empId));
		return "success";
	}

	public String addCareer() {
		try {
			career.setStartTime(sdf.parse(startDate));
			career.setEndTime(sdf.parse(endDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		employeeManager.addCareer(career);
		return "success";
	}

	public String updateCareer() {
		try {
			career.setStartTime(sdf.parse(startDate));
			career.setEndTime(sdf.parse(endDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		employeeManager.updateCareer(career);
		return "success";
	}

	@SkipValidation
	public String editCareer() {
		career = employeeManager.findCareerById(career.getId());
		startDate = sdf.format(career.getStartTime());
		endDate = sdf.format(career.getEndTime());
		return "success";
	}

	@SkipValidation
	public String deleteCareer() {
		employeeManager.deleteCareer(career.getId());
		return "success";
	}
}
