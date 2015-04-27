<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>Fullname</th>
			<th>Email</th>
			<th>Phone</th>
		</tr>
		<s:iterator value="employeeList">
			<tr>
				<td><s:property value="fullname" /></td>
				<td><s:property value="email" /></td>
				<td><s:property value="phone" /></td>
				<td><s:url id="editUrl" action="editEmployee">
						<s:param name="id" value="%{id}" />
					</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
				<td><s:url id="deleteUrl" action="deleteEmployee">
						<s:param name="id" value="%{id}" />
					</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
			</tr>
		</s:iterator>
	</table>
	<br />
	<a href="add.jsp">Add New Employee</a>
</body>
</html>