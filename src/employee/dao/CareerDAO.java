package employee.dao;

import java.util.List;

import employee.entity.Career;

public interface CareerDAO {
	Integer addCareer(Career career);

	void updateCareer(Career career);

	void deleteCareer(Integer id);

	List<Career> listCareerByEmployee(Integer empId);

	Career findCareerById(Integer id);
}
