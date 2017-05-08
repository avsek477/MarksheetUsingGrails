<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/26/2017
  Time: 9:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Page</title>
    <meta name="layout" content="main">
</head>

<body>
<g:form name="formLogin" action="postLogin">
    <table>
        <tr>
            <td>Username</td>
            <td><g:textField name="username"></g:textField></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><g:passwordField name="password"></g:passwordField></td>
        </tr>
        <tr>
            <td colspan="2"><g:submitButton name="login" value="login"></g:submitButton></td>
        </tr>
    </table>
</g:form>
</body>
</html>