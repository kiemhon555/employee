package employee.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import employee.dao.EmployeeDAO;

@Path("/service")
public class EmployeeService {

	private EmployeeDAO employeeDAO;

	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	@GET
	@Path("/searchAutocomplete")
	@Produces(MediaType.APPLICATION_JSON)
	public Response searchAuto(@QueryParam("searchText") String searchText) {
		List<String> list = employeeDAO
				.searchForEmployeeAutocomplete(searchText);
		return Response.ok(new GenericEntity<List<String>>(list) {
		}).build();
	}
}
