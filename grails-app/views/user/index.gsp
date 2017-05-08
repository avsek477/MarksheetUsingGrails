<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/18/2017
  Time: 7:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>User List</title>
</head>

<body>
<div class="nav">
    <ul>
        <li><g:link action="create">Create User</g:link></li>
        <li style="float: right"><g:form action="search">
            <g:textField name="keyword" placeholder="Search User"></g:textField>
            <g:submitButton name="btn" value="search"></g:submitButton>
        </g:form>
        </li>
    </ul>
</div>

<g:if test="${flash.message}">
    <h3>${flash.message}</h3>
</g:if>

<h1 style="font-family: Calibri; font-weight: bold; font-size: 25px">USER LIST</h1>
<table>
    <thead>
        <tr>
            <th>SN</th>
            <th>User Name</th>
            <th>Type</th>
            <g:if test="${session.user_type == 'admin'}">
                <th>Edit</th>
                <th>Delete</th>
            </g:if>
        </tr>
    </thead>
    <tbody>
        <g:each in="${ulist}" var="${list}" status="i">
            <tr>
                <td>${i+1}</td>
                <td>${list.username}</td>
                <td>${list.user_type}</td>
                <g:if test="${session.user_type == 'admin'}">
                   <td><g:link action="edit" id="${list.id}">Edit</g:link></td>
                   <td><g:link action="delete" id="${list.id}" onclick="return confirm('Are you sure?')">Delete</g:link></td>
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