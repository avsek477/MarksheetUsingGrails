<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 5/2/2017
  Time: 7:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    %{--<link rel="stylesheet" href="css/style.css">--}%
</head>

<body>

<div class="container">
    <section id="content">
        <g:form action="postLogin">
            <h1>Login Form</h1>
            <div>
                <g:textField placeholder="Username" required="" name="username"></g:textField>
            </div>
            <div>
                <g:textField placeholder="Password" required="" name="password" ></g:textField>
            </div>
            <div>
                <g:submitButton name="submit" value="Submit"></g:submitButton>
            </div>
        </g:form><!-- form -->

    </section><!-- content -->
</div><!-- container -->

</body>
</html>