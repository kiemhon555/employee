<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Employee</title>
</head>
<body>
	<s:push value="employee">
		<h3>Information</h3>
		<s:form action="updateEmployee" method="post"
			enctype="multipart/form-data">
			<s:hidden name="id" />
			<s:textfield name="fullname" label="Fullname" />
			<s:textfield name="email" label="Email" />
			<s:textfield name="phone" label="Phone" />
			<s:file name="fileUpload" label="Select Image" />
			<tr>
				<td colspan="2"><img alt=""
					src="<s:property value="imageUrl" />" /></td>
			</tr>
			<s:submit value="Update Employee" />
		</s:form>
		<hr />
		<h3>Skillsets</h3>
		<table>
			<tr>
				<th>Technology</th>
				<th>Experienced Years</th>
				<th>Recent Working</th>
			</tr>
			<s:iterator value="skillsetList">
				<tr>
					<td><s:property value="technology" /></td>
					<td><s:property value="experiencedYears" /></td>
					<td><s:date name="recentDate" format="dd-MM-yyyy" /></td>
					<td><s:url id="editUrl" action="editSkillset">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
					<td><s:url id="deleteUrl" action="deleteSkillset">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
				</tr>
			</s:iterator>
			<tr>
				<td><s:url id="addUrl" action="addPrepareSkillset">
						<s:param name="empId" value="%{id}" />
					</s:url> <s:a href="%{addUrl}">Add New Skillset</s:a></td>
			</tr>
		</table>
		<hr />
		<h3>Career</h3>
		<table>
			<tr>
				<th>Position</th>
				<th>Description</th>
				<th>Project</th>
				<th>Technology</th>
				<th>Platform</th>
				<th>Start Time</th>
				<th>End Time</th>
			</tr>
			<s:iterator value="careerList">
				<tr>
					<td><s:property value="position" /></td>
					<td><s:property value="description" /></td>
					<td><s:property value="project" /></td>
					<td><s:property value="technology" /></td>
					<td><s:property value="platform" /></td>
					<td><s:date name="startTime" format="dd-MM-yyyy" /></td>
					<td><s:date name="endTime" format="dd-MM-yyyy" /></td>
					<td><s:url id="editUrl" action="editCareer">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
					<td><s:url id="deleteUrl" action="deleteCareer">
							<s:param name="id" value="%{id}" />
						</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
				</tr>
			</s:iterator>
			<tr>
				<td><s:url id="addUrl" action="addPrepareCareer">
						<s:param name="empId" value="%{id}" />
					</s:url> <s:a href="%{addUrl}">Add New Career</s:a></td>
			</tr>
		</table>
	</s:push>
</body>
</html>