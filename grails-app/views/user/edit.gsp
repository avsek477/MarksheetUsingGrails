<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/18/2017
  Time: 8:18 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>Edit User</title>
</head>

<body>
<g:form action="update">
    <g:hiddenField name="id" value="${userInfo.id}"></g:hiddenField>
    <g:render template="form"></g:render>
    <div><g:submitButton name="Update"></g:submitButton></div>
</g:form>
</body>
</html>