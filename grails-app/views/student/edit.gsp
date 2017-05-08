<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/20/2017
  Time: 6:33 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>Edit Student</title>
</head>

<body>
<h2>Update user</h2>
<g:form action="update" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${studentInfo.id}"></g:hiddenField>
    <g:hiddenField name="hiddenImage" value="${studentInfo.image}"></g:hiddenField>
        <g:render template="studentform"></g:render>
    <div><g:submitButton name="Update"></g:submitButton></div>
</g:form>
</body>
</html>