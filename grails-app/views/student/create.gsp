<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/19/2017
  Time: 7:33 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>Create Students</title>
</head>

<body>
<g:hasErrors bean="${studentInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${studentInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<h2>Create Student</h2>
<g:form action="save" enctype="multipart/form-data">
    <g:render template="studentform"></g:render>
    %{--<div>
        <fieldset class="buttons">
            <g:submitButton  name="Create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </div>--}%
    <div><g:submitButton name="create" value="Create Student"></g:submitButton></div>
</g:form>
</body>
</html>