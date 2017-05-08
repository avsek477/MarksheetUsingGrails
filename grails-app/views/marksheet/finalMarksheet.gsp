<%--
  Created by IntelliJ IDEA.
  User: Avsek
  Date: 4/30/2017
  Time: 8:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mylayout">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">--}%
    %{--<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">--}%
    <title>Final Marksheet</title>
</head>

<body>

    <div class="container text-center" style="background-color: #1b6d85">
        <div class="row form-group">
            <div class="col-md-2" ><img class="img-responsive img-circle" style="height: 80px; width: 100px; margin-bottom: -20px" src="../images/th.jpg"></div>
            <div class="col-md-8"><h1 style="font-family: GungsuhChe; font-size: 40px">SANEPA ENGINEERING COLLEGE</h1></div>
            %{--<div "><span class="float: right">anfjlaljf</span></div>--}%
        </div>

    </div>

    <div %{--style="width: 300px; float: right"--}% >
        <div class="row" style="margin-top: 20px">
            <h3 class="text-center" style="font-weight: bold; font-family: 'Lucida Calligraphy'">Student Information</h3>
            <div class="col-md-7">

                <table class="table table-bordered table-hover" style="width: 300px; float: right">
                    <g:each in="${marksheet}" status="i" var="list">
                        <g:if test="${i==0}" >
                            <tr>
                                <td class="text-center" style="font-weight: bold">Student Name:</td>
                                <td class="text-center" style="font-weight: bold">${list.st.name} </td>
                            </tr>
                            <tr>
                                <td class="text-center" style="font-weight: bold">Batch: </td>
                                <td class="text-center" style="font-weight: bold">${list.st.batch} </td>
                            </tr>
                            <tr>
                                <td class="text-center" style="font-weight: bold">Roll No:</td>
                                <td class="text-center" style="font-weight: bold">${list.st.rollNo}</td>
                            </tr>
                        </g:if>
                    </g:each>
                </table>
            </div>
            <div class="col-md-4">
                <g:each in="${marksheet}" status="i" var="stud">
                    <g:if test="${i==0}">
                        <g:img dir="images/StudentImage" file="${stud.st.image}" width="100"></g:img>
                    </g:if>
                </g:each>
            </div>
        </div>

</div>

<div class="container" style="margin-top: 20px">
<table class="table table-striped table-hover" >
    <thead>
        <th class="text-center alert-info">S.N.</th>
        <th class="text-center alert-info">Subject</th>
        <th class="text-center alert-info">Total Marks</th>
        <th class="text-center alert-info">Pass Marks</th>
        <th class="text-center alert-info">Obtained Marks</th>
    </thead>
    <tbody>
    <g:each in="${marksheet}" status="i" var="list">
        <tr>
        <td class="text-center">${i+1}</td>
        <td class="text-center">${list.sj.name}</td>
        <td class="text-center">${list.sj.totalMarks}</td>
        <td class="text-center">${list.sj.passMarks}</td>
        <g:if test="${list.marks < list.sj.passMarks}">
            <td class="text-center" style="color: red">${list.marks}</td>
        </g:if>
            <g:if test="${list.marks >= list.sj.passMarks}">
                <td class="text-center">${list.marks}</td>
            </g:if>
        </tr>
    </g:each>

    <tr>
        <td></td>
        <td class="text-center"><h3>Total</h3></td>
        <td class="text-center"><h3>${finalTotalMarks}</h3></td>
        <td class="text-center"><h3>${finalPassMarks}</h3></td>
        <td class="text-center"><h3>${finalMarks}</h3></td>
    </tr>
    </tbody>
</table>
</div>
<div class="container" style="width: 350px">
<h3 class="text-center" style="font-family: GungsuhChe">FINAL REMARKS</h3>
<table class="table table-striped table-hover">

    <tr>
        <td class="text-center">Percentage</td>
        <td class="text-center">${percentage+" %"}</td>
    </tr>
    <tr>
        <td class="text-center">Result</td>
        <g:if test="${pf.equalsIgnoreCase("passed")}">
        <td class="text-center alert-success">${pf}</td></g:if>
        <g:if test="${pf.equalsIgnoreCase("failed")}">
            <td class="text-center alert-danger">${pf}</td></g:if>
    </tr>
</table>
    <div class="text-center">
        <g:if test="${pf.equalsIgnoreCase("PASSED")}">
            <h3 style="font-family: GungsuhChe" class="text-center">CONGRATULATIONS</h3>
        </g:if>
        <g:if test="${pf.equalsIgnoreCase("FAILED")}">
            <h3 style="font-family: GungsuhChe" class="text-center">You failed in ${count} subject(s)</h3>
        </g:if>
    </div>

</div>
%{--
<div style="margin-left: 550px">
<h3>Percentage : ${percentage+" %"}</h3>
    <h3>Result     : ${pf}</h3>
    <g:if test="${pf.equalsIgnoreCase("PASSED")}">
        <h3>Congratulations</h3>
    </g:if>
    <g:if test="${pf.equalsIgnoreCase("FAILED")}">
        <h2>You failed in ${count} subject(s)</h2>
    </g:if>
</div>--}%
</body>
</html>