<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Search Results</title>
<sb:head />
</head>
<body>
	<div class="container">
		<s:form cssClass="form-horizontal" action="searchEmployee"
			method="get">
			<s:select label="Sort"
				list="#{'nameAsc':'Name A->Z','nameDesc':'Name Z->A'}"
				headerKey="-1" headerValue="Select Filter" name="sortBy"
				onchange="submit()" />
		</s:form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Fullname</th>
					<th>Email</th>
					<th>Phone</th>
				</tr>
			</thead>
			<tbody>
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
			</tbody>
		</table>
		<br /> <a href="add.jsp">Add New Employee</a> <br /> <br />
		<s:iterator value="pages" var="page">
			<s:url id="pageUrl" action="paginationEmployee">
				<s:param name="pageNum" value="%{page}" />
			</s:url>
			<s:a href="%{pageUrl}">
				<s:property />
			</s:a>
		</s:iterator>
	</div>
</body>
</html>