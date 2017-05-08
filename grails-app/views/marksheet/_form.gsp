<%@ page import="grails.Marksheet" %>



<div class="fieldcontain ${hasErrors(bean: marksheetInstance, field: 'marks', 'error')} required">
	<label for="marks">
		<g:message code="marksheet.marks.label" default="Marks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="marks" type="number" value="${marksheetInstance.marks}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: marksheetInstance, field: 'sj', 'error')} required">
	<label for="sj">
		<g:message code="marksheet.sj.label" default="Sj" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sj" name="sj.id" from="${grails.Subjects.list()}" optionKey="id"
			  optionValue="name"
			  required="" value="${marksheetInstance?.sj?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marksheetInstance, field: 'st', 'error')} required">
	<label for="st">
		<g:message code="marksheet.st.label" default="St" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="st" name="st.id" from="${grails.Student.list()}" optionKey="id"
			  optionValue="name"
			  required="" value="${marksheetInstance?.st?.id}" class="many-to-one"/>
</div>

