<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<sj:head />
<sb:head />
</head>
<body>
	<div class="container">
		<tiles:insertAttribute name="header" />
		<br />
		<hr />
		<tiles:insertAttribute name="menu" />
		<br />
		<hr />
		<tiles:insertAttribute name="body" />
		<br />
		<hr />
		<tiles:insertAttribute name="footer" />
		<br />
	</div>
</body>
</html>