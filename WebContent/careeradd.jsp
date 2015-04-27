<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Career</title>
<sj:head />
</head>
<body>
	<h3>Career Add</h3>
	<s:form action="addCareer" method="post">
		<s:textfield name="position" label="Position" />
		<s:textfield name="description" label="Description" />
		<s:textfield name="project" label="Project" />
		<s:textfield name="technology" label="Technology" />
		<s:textfield name="platform" label="Platform" />
		<sj:datepicker name="startDate" displayFormat="dd-mm-yy"
			changeMonth="true" changeYear="true" label="Started Date" />
		<sj:datepicker name="endDate" displayFormat="dd-mm-yy"
			changeMonth="true" changeYear="true" label="Ended Date" />
		<s:submit value="Add Career" />
	</s:form>
</body>
</html>