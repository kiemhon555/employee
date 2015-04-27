package employee.entity;

import java.util.Set;

public class Employee {

	private int id;
	private String fullname;
	private String email;
	private String phone;
	private Set<Skillset> skillsetList;
	private Set<Career> careerList;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set<Skillset> getSkillsetList() {
		return skillsetList;
	}

	public void setSkillsetList(Set<Skillset> skillsetList) {
		this.skillsetList = skillsetList;
	}

	public Set<Career> getCareerList() {
		return careerList;
	}

	public void setCareerList(Set<Career> careerList) {
		this.careerList = careerList;
	}

}
