<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Management</title>
<script src="js/jquery.1.10.2.min.js"></script>
<script src="js/jquery.autocomplete.min.js"></script>
<script src="js/autocompleter.js"></script>
<link href="css/main.css" rel="stylesheet">
<script>
	
</script>
</head>
<body>
	<h1>Welcome ${pageContext.request.userPrincipal.name}</h1>
	<a href="j_spring_security_logout">Logout</a>
	<s:form action="searchEmployee" method="get">
		<s:textfield name="searchText" label="Search" />
		<s:select
			list="#{'years':'Years','tech':'Technology', 'project':'Project', 'skill':'Skill'}"
			headerKey="name" headerValue="Name" name="searchIn" />
	</s:form>
	<s:form action="searchAutocomplete" method="get">
		<s:textfield name="searchText" label="Autocomplete" id="search" />
	</s:form>
	<br />
	<h1>List Employees</h1>
	<s:action name="listEmployees" executeResult="true" />
</body>
</html>