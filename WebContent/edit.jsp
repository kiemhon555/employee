<%@ taglib prefix="s" uri="/struts-tags"%>
<s:push value="employee">
	<h3>Information</h3>
	<s:form cssClass="form-horizontal" action="admin/updateEmployee"
		method="post" enctype="multipart/form-data">
		<s:hidden name="id" />
		<s:textfield name="fullname" label="Fullname" />
		<s:textfield name="email" label="Email" />
		<s:textfield name="phone" label="Phone" />
		<s:file name="fileUpload" label="Select Image" />
		<s:if test="%{image != null}">
			<s:div cssClass="form-group">
				<s:div cssClass="col-sm-offset-3 col-md-9">
					<img src="<s:url action='ImageAction' />" />
				</s:div>
			</s:div>
		</s:if>
		<s:div cssClass="form-group">
			<s:div cssClass="col-sm-offset-3 col-md-9">
				<s:submit cssClass="btn btn-primary" value="Update Employee" />
			</s:div>
		</s:div>
		<s:hidden name="%{#attr._csrf.parameterName}"
			value="%{#attr._csrf.token}" />
	</s:form>
	<hr />
	<h3>Skillsets</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Technology</th>
				<th>Experienced Years</th>
				<th>Recent Working</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="skillsetList">
				<tr>
					<td><s:property value="technology" /></td>
					<td><s:property value="experiencedYears" /></td>
					<td><s:date name="recentDate" format="dd-MM-yyyy" /></td>
					<td><s:url id="editUrl" action="admin/editSkillset">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
					<td><s:url id="deleteUrl" action="admin/deleteSkillset">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
				</tr>
			</s:iterator>
			<tr>
				<td><s:url id="addUrl" action="admin/addPrepareSkillset">
						<s:param name="empId" value="%{id}" />
					</s:url> <s:a href="%{addUrl}">Add New Skillset</s:a></td>
			</tr>
		</tbody>
	</table>
	<hr />
	<h3>Career</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Position</th>
				<th>Description</th>
				<th>Project</th>
				<th>Technology</th>
				<th>Platform</th>
				<th>Start Time</th>
				<th>End Time</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="careerList">
				<tr>
					<td><s:property value="position" /></td>
					<td><s:property value="description" /></td>
					<td><s:property value="project" /></td>
					<td><s:property value="technology" /></td>
					<td><s:property value="platform" /></td>
					<td><s:date name="startTime" format="dd-MM-yyyy" /></td>
					<td><s:date name="endTime" format="dd-MM-yyyy" /></td>
					<td><s:url id="editUrl" action="admin/editCareer">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
					<td><s:url id="deleteUrl" action="admin/deleteCareer">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
				</tr>
			</s:iterator>
			<tr>
				<td><s:url id="addUrl" action="admin/addPrepareCareer">
						<s:param name="empId" value="%{id}" />
					</s:url> <s:a href="%{addUrl}">Add New Career</s:a></td>
			</tr>
		</tbody>
	</table>
</s:push>