<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>

	<div id="grailsLogo" role="banner" style="background-color: #1b6d85"><img src="${resource(dir: 'images', file: '../images/th.jpg')}" style="margin-left: 50px; height: 100px; width: 100px; border-radius: 50%" alt="Sanepa Engineering College"/><span style="float: right; margin-right: 200px; margin-top: -5px ; font-size: 35px; font-family: GungsuhChe; font-wieght: bold;"><h1 style="color: #0f0f0f">SANEPA ENGINEERING COLLEGE</h1></span></div>
	<g:if test="${session.userid}">
    <div class="nav">
        <ul>
            <li><g:link controller="user" action="index">User</g:link> </li>
            <li><g:link controller="student" action="index">Student</g:link> </li>
            <li><g:link controller="subjects" action="index">Subjects</g:link> </li>
            <g:if test="${session.user_type=='admin'}">
				<li><g:link controller="marksheet" action="list">Marksheet</g:link> </li>
			</g:if>
			<g:if test="${session.user_type!='admin'}">
				<li><g:link controller="marksheet" action="print">Marksheet</g:link> </li>
			</g:if>
            <li style="float: right"><g:link controller="home" action="logout">Logout</g:link> </li>
        </ul>
	</div>
    </g:if>
    <g:layoutBody/>
		<div class="footer" role="contentinfo" style="background-color: #1b6d85"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
