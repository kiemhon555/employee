<%@ taglib prefix="s" uri="/struts-tags"%>
<script src="js/jquery.autocomplete.min.js"></script>
<script src="js/autocompleter.js"></script>
<link href="css/main.css" rel="stylesheet">
<ul class="nav nav-pills">
	<li><a href="admin">Home</a></li>
	<li class="dropdown"><a class="dropdown-toggle"
		data-toggle="dropdown" href="#">Employee<span class="caret"></span></a>
		<ul class="dropdown-menu">
			<li><a href="listEmployees">List</a></li>
			<li><a href="addPrepareEmployee">Add</a></li>
			<li><a href="searchEmployeeTo">Search</a></li>
		</ul></li>
	<li><s:form cssClass="form-horizontal" action="searchAutocomplete"
			method="get">
			<s:textfield name="searchText" id="search" />
		</s:form></li>
</ul>