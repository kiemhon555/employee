<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Add new Employee</title>
<sb:head />
</head>
<body>
	<div class="container">
		<s:form cssClass="form-horizontal" action="addEmployee" method="post"
			enctype="multipart/form-data">
			<s:textfield name="fullname" label="Fullname" />
			<s:textfield name="email" label="Email" />
			<s:textfield name="phone" label="Phone" />
			<s:file name="fileUpload" label="Select Image" />
			<s:submit value="Add Employee" cssClass="btn btn-primary" />
			<s:hidden name="%{#attr._csrf.parameterName}"
				value="%{#attr._csrf.token}" />
		</s:form>
	</div>
</body>
</html>