<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/30/2017
  Time: 2:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'navstyle.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.min.js')}" type="text/css">--}%
    <title>Search Student Marksheet</title>
    <meta name="layout" content="mylayout">
</head>

<body>
%{--<div class="nav navbar-top">
    <ul>
        <li><g:link action="create" controller="marksheet">Create Marksheet</g:link> </li>
        <li><g:link action="list" controller="marksheet">Marksheet List</g:link> </li>
    </ul>
</div>--}%
<g:if test="${flash.message}">
    <h2>${flash.message}</h2>
</g:if>
<div id="toggleMenu" onclick="toggleMenu()"></div>
<nav id="menu">
    <img class="img-responsive img-circle" src="../images/th.jpg">

    <g:form action="finalMarksheet">

    <div style="margin-top: 50px; margin-left: 10px"><h1 style="font-family: 'Lucida Calligraphy'; font-weight: bold">Marksheet</h1></div>
    <div style="width: 90%; margin-left: 12px">
        <input type="text" class="form-control" placeholder="Batch" required="" name="batch" id="batch">
    </div>
    <div style="margin-top: 10px; width: 90%; margin-left: 12px">
        <input type="text" class="form-control" placeholder="Roll Number" required="" name="rollNo" id="rollNo">
    </div>
    <div style="margin-top: 20px; margin-left: 65px">
        <button type="button" class="btn btn-success" onclick="showResult()">Show Result</button>
    </div>
</g:form>

</nav>

<div id="div_show_result" ></div>

<script>
    function showResult() {
        var batch = $("#batch").val();
        var rollNo = $("#rollNo").val();
        var ajaxurl = "${createLink(controller: "marksheet", action: "finalMarksheet")}"
        $.ajax({
            url: ajaxurl,
            method: "POST",
            data:"batch="+batch+"&rollNo="+rollNo,
            success:function(msg){
                $(".modal-dialog");
                $("#div_show_result").html(msg);
            }
        })
    }
    var toggleStatus = 1;
    function toggleMenu() {
        if(toggleStatus == 1){
            document.getElementById("menu").style.left = "-240px";
            toggleStatus = 0;
        }else if(toggleStatus == 0){
            document.getElementById("menu").style.left = "0px";
            toggleStatus = 1;
        }
    }
</script>
</body>
</html>