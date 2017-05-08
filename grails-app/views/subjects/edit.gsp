<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/19/2017
  Time: 11:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title></title>
</head>

<body>
<h2>Update Subjects</h2>
<g:form action="update">
    <g:hiddenField name="id" value="${subjectsInfo.id}"></g:hiddenField>
    <g:render template="subjectform"></g:render>
    <div><g:submitButton name="Update"></g:submitButton></div>
</g:form>
</body>
</html>