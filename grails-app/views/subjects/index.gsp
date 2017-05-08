<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/19/2017
  Time: 10:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>Subject Info</title>
</head>

<body>
<div class="nav">
    <ul>
        <li><g:link action="create">Create Subjects</g:link></li>
        <li style="float: right"><g:form action="search">
            <g:textField name="keyword" placeholder="Search Subjects"></g:textField>
            <g:submitButton name="btn" value="search"></g:submitButton>
        </g:form>
        </li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div>${flash.message}</div>
</g:if>

<h1 style="font-family: Calibri; font-weight: bold; font-size: 25px">SUBJECTS LIST</h1>
<table>
    <thead>
        <tr>
            <th>S. no.</th>
            <th>Name</th>
            <th>Total Marks</th>
            <th>Pass Marks</th>
            <g:if test="${session.user_type=='admin'}">
                <th>Action</th>
            </g:if>
        </tr>
    </thead>
    <tbody>
    <g:each in="${subList}" var="list" status="i">
        <tr>
            <td>${i+1}</td>
            <td>${list.name}</td>
            <td>${list.totalMarks}</td>
            <td>${list.passMarks}</td>
            <g:if test="${session.user_type=='admin'}">
                <td><g:link action="edit" id="${list.id}" onclick="return confirm('Are you sure?')">Edit</g:link>        <g:link action="delete" id="${list.id}" onclick="return confirm('Are you sure?')">Delete</g:link></td>
            </g:if>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">

    <g:paginate total="${totalCount}" params="${params}"></g:paginate>
</div>
</body>
</html>