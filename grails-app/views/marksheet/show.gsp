
<%@ page import="grails.Marksheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marksheet.label', default: 'Marksheet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-marksheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-marksheet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list marksheet">
			
				<g:if test="${marksheetInstance?.marks}">
				<li class="fieldcontain">
					<span id="marks-label" class="property-label"><g:message code="marksheet.marks.label" default="Marks" /></span>
					
						<span class="property-value" aria-labelledby="marks-label"><g:fieldValue bean="${marksheetInstance}" field="marks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${marksheetInstance?.sj}">
				<li class="fieldcontain">
					<span id="sj-label" class="property-label"><g:message code="marksheet.sj.label" default="Sj" /></span>
					
						<span class="property-value" aria-labelledby="sj-label">%{--<g:link controller="subjects" action="show" id="${marksheetInstance?.sj?.id}">--}%${marksheetInstance.sj.name}%{--</g:link>--}%</span>
					
				</li>
				</g:if>
			
				<g:if test="${marksheetInstance?.st}">
				<li class="fieldcontain">
					<span id="st-label" class="property-label"><g:message code="marksheet.st.label" default="St" /></span>
					
						<span class="property-value" aria-labelledby="st-label">%{--<g:link controller="student" action="show" id="${marksheetInstance?.st?.id}">${marksheetInstance?.st?.encodeAsHTML()}</g:link>--}%${marksheetInstance.st.name}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${marksheetInstance?.id}" />
					<g:link class="edit" action="edit" id="${marksheetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
