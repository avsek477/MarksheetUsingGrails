<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/19/2017
  Time: 7:31 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
    <title>Student Views</title>
</head>

<body>
<div class="nav">
    <ul>
        <li><g:link action="create">Create Student</g:link></li>
        <li style="float: right"><g:form action="search">
                <g:textField name="keyword" placeholder="Search Student"></g:textField>
                <g:submitButton name="btn" value="search"></g:submitButton>
            </g:form>
        </li>
    </ul>
</div>
<g:if test="${flash.message}">
    <div>${flash.message}</div>
</g:if>

<h1 style="font-family: Calibri; font-weight: bold; font-size: 25px">STUDENT LIST</h1>
<table>
    <thead>
    <tr>
        <th>SN</th>
        <th>Name</th>
        <th>Address</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Roll No.</th>
        <th>Batch</th>
        <th>Image</th>
        <g:if test="${session.user_type=='admin'}">
            <th>Edit</th>
            <th>Delete</th>
        </g:if>
    </tr>
    </thead>
    <tbody>
    <g:each in="${sList}" var="${list}" status="i">
        <tr>
            <td>${i+1}</td>
            <td>${list.name}</td>
            <td>${list.address}</td>
            <td>${list.email}</td>
            <td>${list.phone}</td>
            <td>${list.rollNo}</td>
            <td>${list.batch}</td>
            <td><g:if test="${list.image}">
                <g:img dir="images/StudentImage" file="${list.image}" width="100"></g:img>
            </g:if></td>
            %{--<td>${list.image}</td>--}%
            <g:if test="${session.user_type=='admin'}">
                <td><g:link action="edit" id="${list.id}" onclick="return confirm('Are you sure?')">Edit</g:link></td>
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