package employee.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import employee.manager.EmployeeManager;
import employee.entity.Employee;

public class EmployeeAction extends ActionSupport implements
		ModelDriven<Employee> {

	private Employee employee;
	private EmployeeManager employeeManager;

	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;

	private String filePath;
	private File fileToCreate;

	private HttpServletRequest servletRequest;

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

	public EmployeeManager getEmployeeManager() {
		return employeeManager;
	}

	public void setEmployeeManager(EmployeeManager employeeManager) {
		this.employeeManager = employeeManager;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	@SkipValidation
	public String addPrepareEmployee() {
		return "success";
	}

	public String addEmployee() {
		if (null != fileUploadFileName) {
			createFile();
			employee.setImageUrl("images/" + fileUploadFileName);
		}
		employeeManager.addEmployee(employee);
		return "success";
	}

	@SkipValidation
	public String editEmployee() {
		employee = employeeManager.findEmployeeById(employee.getId());
		return "success";
	}

	public String updateEmployee() {
		String img = employee.getImageUrl();
		if (null != fileUploadFileName) {
			createFile();
			employee.setImageUrl("images/" + fileUploadFileName);
		} else {
			employee.setImageUrl(img);
		}
		employeeManager.updateEmployee(employee);
		return "success";
	}

	@SkipValidation
	public String deleteEmployee() {
		employeeManager.deleteEmployee(employee.getId());
		return "success";
	}

	private void createFile() {
		servletRequest = (HttpServletRequest) ActionContext.getContext().get(
				ServletActionContext.HTTP_REQUEST);
		filePath = servletRequest.getSession().getServletContext()
				.getRealPath("/")
				+ "images";
		try {
			fileToCreate = new File(filePath, this.fileUploadFileName);
			FileUtils.copyFile(this.fileUpload, fileToCreate);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
