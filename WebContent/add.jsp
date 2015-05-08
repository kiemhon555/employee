<%@ taglib prefix="s" uri="/struts-tags"%>
<s:form cssClass="form-horizontal" action="admin/addEmployee" method="post"
	enctype="multipart/form-data">
	<s:textfield name="fullname" label="Fullname" />
	<s:textfield name="email" label="Email" />
	<s:textfield name="phone" label="Phone" />
	<s:file name="fileUpload" label="Select Image" />
	<s:div cssClass="form-group">
		<s:div cssClass="col-sm-offset-3 col-md-9">
			<s:submit value="Add Employee" cssClass="btn btn-primary" />
		</s:div>
	</s:div>
	<s:hidden name="%{#attr._csrf.parameterName}"
		value="%{#attr._csrf.token}" />
</s:form>