<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Skillset Update</title>
<sj:head />
</head>
<body>
	<h3>Skillset Edit</h3>
	<s:form action="updateSkillset" method="post">
		<s:push value="skillset">
			<s:hidden name="id" />
			<s:textfield name="technology" label="Technology" />
			<s:textfield name="experiencedYears" label="Experienced Years" />
			<sj:datepicker name="dateInput" displayFormat="dd-mm-yy"
				changeMonth="true" changeYear="true" label="Recent Working" />
			<s:submit value="Update Skillset" />
		</s:push>
	</s:form>
</body>
</html>