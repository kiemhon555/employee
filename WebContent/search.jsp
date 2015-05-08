<%@ taglib prefix="s" uri="/struts-tags"%>
<s:form cssClass="form-horizontal" action="admin/searchEmployee"
	method="get">
	<s:textfield name="searchText" label="Search" />
	<s:select
		list="#{'years':'Years','tech':'Technology', 'project':'Project', 'skill':'Skill'}"
		headerKey="name" headerValue="Name" name="searchIn" label="Filter" />
</s:form>