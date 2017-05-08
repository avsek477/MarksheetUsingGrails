<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/19/2017
  Time: 10:57 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>Create subject</title>
</head>

<body>
<h2>Create subject</h2>
<g:form action="save">
    <g:render template="subjectform"></g:render>
    <div><g:submitButton name="Save"></g:submitButton></div>
</g:form>
</body>
</html>