<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.ibm.cloudoe.samples.i18n.messages" />
<!DOCTYPE html>
<html lang="${language}">
<head>
<title><fmt:message key="application.title" /></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/watson-bootstrap-dark.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
    console.log("Your locale is ${language}");
</script>
</head>
<body>
<div class="container">
<div class="row">
	<div class="col-lg-12">
		<div class="row top-nav">
			<div class="col-lg-12">
				<a href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/personality-insights.html"
					class="left"><fmt:message key="application.label.learnmore" /></a>
				<a href="https://github.com/watson-developer-cloud/personality-insights-java"
					class="right fork"><fmt:message key="application.label.fork"/></a>
				<a href="mailto:watsondevelopercloud@wwpdl.vnet.ibm.com"
					class="right"><fmt:message key="application.label.contactus"/></a>
				<a href="https://developer.ibm.com/answers" class="right"><fmt:message key="application.label.watsoncommunity"/></a>
			</div>
		</div>
		<div style="padding-bottom: 0px;" class="row header">
		<div class="avatar img-container col-lg-1 col-xs-1">
			<img src="images/app.png">
		</div>
		<div class="col-lg-6 col-xs-6">
			<h2><fmt:message key="application.name" /></h2>
			<p><fmt:message key="application.service.description"/></p>
		</div>
		<div class="col-lg-4 col-xs-4">
			<h3><fmt:message key="application.label.keepexploring"/>:</h3>
			<a
				href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/personality-insights/"
				class="left"><fmt:message key="application.label.documentation"/></a><a
				href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/apis/#!/personality-insights"
				class="right"><fmt:message key="application.label.apidetails"/></a>
		</div>
	</div>
</div>
</div>
<div class="row">
<div class="col-lg-6 col-md-6 col-xs-12">
	<h2>Try the service</h2>
	<div class="well">
		<div class="form-group row">
			<div class="col-lg-12 col-xs-12">
                <fmt:message key="application.inputeditor.placeholder" var="textEditorPlaceHolder" />
				<textarea rows="8" required
					placeholder="${textEditorPlaceHolder}"
					class="content form-control"><fmt:message key="application.inputeditor.content" /></textarea>
				<div class="text-right">
					<span class="wordsCount small"></span>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-lg-4 col-lg-push-4 col-xs-4">
				<button type="button" class="btn btn-block clear-btn"><fmt:message key="application.inputeditor.clear" /></button>
			</div>
			<div class="col-lg-4 col-lg-push-4 col-xs-4 col-xs-push-4">
				<button type="button" class="btn btn-block analysis-btn"><fmt:message key="application.inputeditor.analyze" /></button>
			</div>
		</div>
	</div>
</div>
<div class="col-lg-6 col-md-6 col-xs-12">
	<div class="row">
		<div style="display:none;" class="form-group row loading text-center loading">
			<h2>&nbsp;</h2>
			<img src="images/watson.gif">
		</div>
		<div style="display: none;" class="form-group row error">
			<h2>&nbsp;</h2>
			<div class="well">
				<p class="errorMsg"></p>
			</div>
		</div>
	</div>
	<div style="display: none;" class="results">
		<h3 style="height: 29px;"><fmt:message key="application.label.yourpersonality"/></h3>
		<div class="well">
			<div class="summary-div"></div>
			<div style="color: gray" class="text-right">
				<em class="small"><fmt:message key="application.label.comparedfootnote"/></em>
			</div>
		</div>
	</div>
</div>
<div style="display: none;" class="results">
	<div class="row">
		<div class="col-lg-5 col-md-5 col-xs-12">
			<h3><fmt:message key="application.label.personalitydata"/></h3>
			<div style="display: none;" class="col540px well traits"></div>
			</div>
			<div class="col-lg-7 col-xs-12 col-md-7">
				<h3><fmt:message key="application.label.personalityvisualizationdata"/></h3>
				<div id="vizcontainer" class="well"></div>
			</div>
		</div>
	</div>
	<div class="hidden">
		<div id="header-template">
			<div class="row theader">
				<div class="col-lg-5 col-xs-5">
					<span><fmt:message key="application.label.name"/></span>
				</div>
				<div class="col-lg-7 col-xs-7 text-right">
					<span><fmt:message key="application.label.value"/> ± <fmt:message key="application.label.samplingerror"/></span>
				</div>
			</div>
		</div>
		<div id="trait-template">
			<div class="row">
				<div class="tname col-lg-7 col-xs-7">
					<span></span>
				</div>
				<div class="tvalue col-lg-5 col-xs-5 text-right">
					<span></span>
				</div>
			</div>
		</div>
		<div id="model-template">
			<div class="row">
				<div class="col-lg-12 col-xs-12 text-center">
					<span></span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/d3.v2.min.js"></script>
	<script type="text/javascript" src="js/demo.js"></script>
	<script type="text/javascript" src="js/personality.js"></script>
	<script type="text/javascript" src="js/textsummary.js"></script>
</body>
</html>