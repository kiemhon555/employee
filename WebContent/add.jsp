<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new Employee</title>
</head>
<body>
	<s:form action="addEmployee" method="post">
		<s:textfield name="fullname" label="Fullname" />
		<s:textfield name="email" label="Email" />
		<s:textfield name="phone" label="Phone" />
		<s:submit value="Add Employee" />
	</s:form>
</body>
</html>