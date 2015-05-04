<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<sb:head />
</head>
<body>
	<div class="container">
		<s:if test="%{#parameters.error != null}">
			<div style="color: red">Invalid User</div>
		</s:if>
		<s:form cssClass="form-horizontal" name="loginForm"
			action="j_spring_security_check" method="post" label="Login">
			<s:textfield name="username" label="Username:" />
			<s:password name="password" label="Password:" />
			<s:div cssClass="form-group">
				<s:div cssClass="col-sm-offset-3 col-md-9">
					<s:submit cssClass="btn btn-primary" value="Login" />
				</s:div>
			</s:div>
		</s:form>
	</div>
</body>
</html>