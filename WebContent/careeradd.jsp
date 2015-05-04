<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Add New Career</title>
<sj:head />
<sb:head />
</head>
<body>
	<div class="container">
		<s:form cssClass="form-horizontal" action="addCareer" method="post" label="Career Add">
			<s:textfield name="position" label="Position" />
			<s:textfield name="description" label="Description" />
			<s:textfield name="project" label="Project" />
			<s:textfield name="technology" label="Technology" />
			<s:textfield name="platform" label="Platform" />
			<sj:datepicker name="startDate" displayFormat="dd-mm-yy"
				changeMonth="true" changeYear="true" label="Started Date" />
			<sj:datepicker name="endDate" displayFormat="dd-mm-yy"
				changeMonth="true" changeYear="true" label="Ended Date" />
			<s:submit cssClass="btn btn-primary" value="Add Career" />
		</s:form>
	</div>
</body>
</html>