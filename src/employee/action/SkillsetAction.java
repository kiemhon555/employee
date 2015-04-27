package employee.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import employee.manager.EmployeeManager;
import employee.entity.Skillset;

public class SkillsetAction extends ActionSupport implements
		ModelDriven<Skillset> {

	private Skillset skillset;
	private List<Skillset> skillsetList;
	private EmployeeManager employeeManager;

	private int empId;
	private String dateInput;

	private SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

	@Override
	public Skillset getModel() {
		return skillset;
	}

	public Skillset getSkillset() {
		return skillset;
	}

	public void setSkillset(Skillset skillset) {
		this.skillset = skillset;
	}

	public List<Skillset> getSkillsetList() {
		return skillsetList;
	}

	public void setSkillsetList(List<Skillset> skillsetList) {
		this.skillsetList = skillsetList;
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

	public String getDateInput() {
		return dateInput;
	}

	public void setDateInput(String dateInput) {
		this.dateInput = dateInput;
	}

	@SkipValidation
	public String addPrepareSkillset() {
		skillset.setEmployee(employeeManager.findEmployeeById(empId));
		return "success";
	}

	public String addSkillset() {
		try {
			skillset.setRecentDate(sdf.parse(dateInput));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		employeeManager.addSkillset(skillset);
		return "success";
	}

	public String updateSkillset() {
		try {
			skillset.setRecentDate(sdf.parse(dateInput));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		employeeManager.updateSkillset(skillset);
		return "success";
	}

	@SkipValidation
	public String editSkillset() {
		skillset = employeeManager.findSkillsetById(skillset.getId());
		dateInput = sdf.format(skillset.getRecentDate());
		return "success";
	}

	@SkipValidation
	public String deleteSkillset() {
		employeeManager.deleteSkillset(skillset.getId());
		return "success";
	}
}
