package employee.action;

import java.io.File;
import java.io.FileInputStream;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import employee.manager.EmployeeManager;
import employee.entity.Employee;

public class EmployeeAction extends ActionSupport implements
		ModelDriven<Employee> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Employee employee;
	private EmployeeManager employeeManager;

	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;

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
		}
		employeeManager.addEmployee(employee);
		return "success";
	}

	private static byte[] imageData;
	private static String imageName, imageType;

	@SkipValidation
	public String editEmployee() {
		employee = employeeManager.findEmployeeById(employee.getId());
		if (null != employee.getImage()) {
			imageData = employee.getImage();
			imageName = employee.getFileName();
			imageType = employee.getContentType();
		}
		return "success";
	}

	public String updateEmployee() {
		employee.setImage(imageData);
		employee.setFileName(imageName);
		employee.setContentType(imageType);
		if (null != fileUploadFileName) {
			createFile();
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
		byte[] bFile = new byte[(int) fileUpload.length()];
		try {
			FileInputStream fileInputStream = new FileInputStream(fileUpload);
			fileInputStream.read(bFile);
			fileInputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		employee.setImage(bFile);
		employee.setContentType(fileUploadContentType);
		employee.setFileName(fileUploadFileName);
	}

	public byte[] getImageInBytes() {
		if (null == imageData) {
			return new byte[0];
		}
		return imageData;
	}

	public String getImageContentType() {
		return imageType;
	}

	@SkipValidation
	public String execute() {
		return "success";
	}
}
