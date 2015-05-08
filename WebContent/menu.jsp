<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value="/js/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/css/main.css" />" rel="stylesheet">
<script>
	$(document).ready(function() {

		$('#search').autocomplete({
			serviceUrl : '<c:url value="/rest/searchAutocomplete" />',
			paramName : "searchText",
			delimiter : ",",
			transformResult : function(response) {

				return {
					// must convert json to javascript object before process
					suggestions : $.map($.parseJSON(response), function(item) {

						return {
							value : item,
							data : item
						};
					})

				};

			}

		});

	});
</script>
<ul class="nav nav-pills">
	<li><a href="admin">Home</a></li>
	<li class="dropdown"><a class="dropdown-toggle"
		data-toggle="dropdown" href="#">Employee<span class="caret"></span></a>
		<ul class="dropdown-menu">
			<li><a href="listEmployees">List</a></li>
			<li><a href="addPrepareEmployee">Add</a></li>
			<li><a href="searchEmployeeTo">Search</a></li>
		</ul></li>
	<li><s:form cssClass="form-horizontal"
			action="admin/searchAutocomplete" method="get">
			<s:textfield name="searchText" id="search" />
		</s:form></li>
</ul>