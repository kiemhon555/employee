<%@ taglib prefix="s" uri="/struts-tags"%>
<s:form cssClass="form-horizontal" action="admin/searchEmployee" method="get">
	<s:select label="Sort"
		list="#{'nameAsc':'Name A->Z','nameDesc':'Name Z->A'}" headerKey="-1"
		headerValue="Select Filter" name="sortBy" onchange="submit()" />
</s:form>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Fullname</th>
			<th>Email</th>
			<th>Phone</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="employeeList">
			<tr>
				<td><s:property value="fullname" /></td>
				<td><s:property value="email" /></td>
				<td><s:property value="phone" /></td>
				<td><s:url id="editUrl" action="admin/editEmployee">
						<s:param name="id" value="%{id}" />
					</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
				<td><s:url id="deleteUrl" action="admin/deleteEmployee">
						<s:param name="id" value="%{id}" />
					</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<br />
<br />
<ul class="pagination">
	<s:iterator value="pages" var="page">
		<s:url id="pageUrl" action="admin/paginationSearchEmployee">
			<s:param name="pageNum" value="%{page}" />
		</s:url>
		<li><s:a href="%{pageUrl}">
				<s:property />
			</s:a></li>
	</s:iterator>
</ul>