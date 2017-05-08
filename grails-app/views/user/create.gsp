<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/18/2017
  Time: 7:42 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Users</title>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
</head>

<body>
<h2>Create User</h2>
<g:form action="save">
    <g:render template="form"></g:render>
    <div><g:submitButton name="Create User"></g:submitButton></div>
</g:form>
</body>
</html>