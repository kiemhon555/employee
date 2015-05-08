<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:form cssClass="form-horizontal" action="admin/updateCareer"
	method="post" label="Career Update">
	<s:push value="career">
		<s:textfield name="position" label="Position" />
		<s:textfield name="description" label="Description" />
		<s:textfield name="project" label="Project" />
		<s:textfield name="technology" label="Technology" />
		<s:textfield name="platform" label="Platform" />
		<sj:datepicker name="startDate" displayFormat="dd-mm-yy"
			changeMonth="true" changeYear="true" label="Started Date" />
		<sj:datepicker name="endDate" displayFormat="dd-mm-yy"
			changeMonth="true" changeYear="true" label="Ended Date" />
		<s:div cssClass="form-group">
			<s:div cssClass="col-sm-offset-3 col-md-9">
				<s:submit cssClass="btn btn-primary" value="Update Career" />
			</s:div>
		</s:div>
		<s:hidden name="employee.id" />
	</s:push>
	<s:hidden name="%{#attr._csrf.parameterName}"
		value="%{#attr._csrf.token}" />
</s:form>