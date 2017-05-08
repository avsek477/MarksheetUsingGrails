
<%@ page import="grails.Marksheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marksheet.label', default: 'Marksheet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-marksheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session.user_type=='admin'}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link action="print">Final Marksheet</g:link></li>

				<li style="float: right"><g:form action="search">
					<g:textField name="keyword" placeholder="Search Marksheet"></g:textField>
					<g:submitButton name="btn" value="search"></g:submitButton>
				</g:form>
				</li>
			</ul>
		</div></g:if>
		<div id="list-marksheet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
				<thead>
					<tr>
						<g:sortableColumn property="marks" title="${message(code: 'marksheet.marks.label', default: 'S. no.')}" />

						<th><g:message code="marksheet.sj.label" default="Marks" /></th>

						<th><g:message code="marksheet.sj.label" default="Subject" /></th>
					
						<th><g:message code="marksheet.st.label" default="Student" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${marksheetInstanceList}" status="i" var="marksheetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:if test="${session.user_type=='admin'}">
							<td><g:link action="show" id="${marksheetInstance.id}">${i+1}</g:link> </td>
						</g:if>
						<g:if test="${session.user_type!='admin'}">
							<td>${i+1}</td>
						</g:if>
						<td>${fieldValue(bean: marksheetInstance, field: "marks")}</td>
					
						<td>${marksheetInstance.sj.name}</td>
					
						<td>${marksheetInstance.st.name}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${marksheetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
