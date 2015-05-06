<%@ taglib prefix="s" uri="/struts-tags"%>
<h3>List Employees</h3>
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
				<td><s:url id="editUrl" action="editEmployee">
						<s:param name="id" value="%{id}" />
					</s:url> <s:a href="%{editUrl}">Edit</s:a></td>
				<td><s:url id="deleteUrl" action="deleteEmployee">
						<s:param name="id" value="%{id}" />
					</s:url> <s:a href="%{deleteUrl}">Delete</s:a></td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<br />
<br />
<s:iterator value="pages" var="page">
	<s:url id="pageUrl" action="paginationEmployee">
		<s:param name="pageNum" value="%{page}" />
	</s:url>
	<s:a href="%{pageUrl}">
		<s:property />
	</s:a>
</s:iterator>