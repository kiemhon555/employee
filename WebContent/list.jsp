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
		<s:url id="pageUrl" action="admin/paginationEmployee">
			<s:param name="pageNum" value="%{page}" />
		</s:url>
		<li><s:a href="%{pageUrl}">
				<s:property />
			</s:a></li>
	</s:iterator>
</ul>