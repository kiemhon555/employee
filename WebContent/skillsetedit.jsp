<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<s:form cssClass="form-horizontal" action="admin/updateSkillset"
	method="post" label="Skillset Edit">
	<s:push value="skillset">
		<s:textfield name="technology" label="Technology" />
		<s:textfield name="experiencedYears" label="Experienced Years" />
		<sj:datepicker name="dateInput" displayFormat="dd-mm-yy"
			changeMonth="true" changeYear="true" label="Recent Working" />
		<s:div cssClass="form-group">
			<s:div cssClass="col-sm-offset-3 col-md-9">
				<s:submit cssClass="btn btn-primary" value="Update Skillset" />
			</s:div>
		</s:div>
		<s:hidden name="employee.id" />
	</s:push>
	<s:hidden name="%{#attr._csrf.parameterName}"
		value="%{#attr._csrf.token}" />
</s:form>