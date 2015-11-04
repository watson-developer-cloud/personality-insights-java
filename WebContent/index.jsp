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
<link rel="stylesheet" href="css/banner.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="row service-container">
		<div class="col-lg-12 service-header">
			<div class="row top-nav navbar-fixed-top">
				<div class="container">
					<a
						href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/"
						class="top-nav--logo-link"><h3 class="heading left">
							IBM <span class="top-nav--logo-wdc">Watson Developer Cloud</span>
						</h3></a>
					<nav class="top-nav--nav">
						<li class="top-nav--nav-item"><a
							href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/services-catalog.html"><fmt:message key="application.label.services"/></a></li>
						<li class="top-nav--nav-item"><a
							href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/"><fmt:message key="application.label.docs"/></a></li>
						<li class="top-nav--nav-item"><a
							href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/gallery.html"><fmt:message key="application.label.appGallery"/></a></li>
						<li class="top-nav--nav-item"><a
							href="https://developer.ibm.com/watson/"><fmt:message key="application.label.community"/></a></li>
					</nav>
				</div>
			</div>
			<div class="row header">
				<div class="container">
					<div
						class="avatar img-container col-lg-2 col-md-2 col-sm-2 hidden-xs">
						<img src="images/app.png" class="service-icon">
					</div>
					<div
						class="col-lg-10 col-md-10 col-sm-10 col-xs-12 dialog-description">
						<h1 style="font-size: 50px;" class="service-title"><fmt:message key="application.name"/></h1>
						<p><fmt:message key="service.description"/></p>
						<div class="resource">
							<img src="images/link.svg" class="link-icon"><strong><fmt:message key="application.label.resources"/>:</strong>
						</div>
						<div class="resource-item-container">
							<a
								href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/personality-insights/api"
								class="resource-item"><fmt:message key="application.label.apiReference"/></a><a
								href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/personality-insights/"
								class="resource-item"><fmt:message key="application.label.documentation"/></a><a
								href="https://github.com/watson-developer-cloud/personality-insights-java"
								class="resource-item"><fmt:message key="application.label.githubFork"/></a><a
								href="https://bluemix.net/deploy?repository=https://github.com/watson-developer-cloud/personality-insights-java.git"
								class="resource-item"><fmt:message key="application.label.bluemixForkAndDeploy"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-12 col-xs-12">
				<h2><fmt:message key="application.input.title"/></h2>
				<p><fmt:message key="application.warning.minimumRecommendedWarning"/></p>                               
                <p><fmt:message key="application.warning.selfReflectiveText"/></p>
				<div class="well">
					<div class="form-group row">
						<div style="padding: 0px;" class="col-lg-12 col-xs-12">
							<label class="col-lg-6 col-md-6 col-xs-6 control-label"><fmt:message key="application.label.chooseLanguage"/>:</label>
							<div class="col-lg-6 col-md-6 col-xs-6 sample-radio-list">
								<div class="sample-radio-container">
									<label><input id="english_radio" type="radio"
										name="sample_text" value="en" checked class="sample-radio"><fmt:message key="application.label.english"/></label>
								</div>
								<div class="sample-radio-container">
									<label><input type="radio" name="sample_text"
										value="es" class="sample-radio"><fmt:message key="application.label.spanish"/></label>
								</div>
							</div>
							<textarea rows="12" required="true" name="text"
								placeholder="<fmt:message key="application.input.placeHolder"/>"
								class="content form-control"></textarea>
							<div class="text-right inputFootnote">
								<span class="wordsCount"></span> <span class="small"></span><fmt:message key="application.label.words"/></span>
							</div>
						</div>
					</div>
					<div style="display: none; margin-bottom: 10px;"
						class="form-group row captcha">
						<div data-sitekey="6LcRbQkTAAAAAGUFVbnuqDfse-XZASLZwoC34oJV"
							class="col-lg-12 col-md-12 col-xs-12 g-recaptcha"></div>
					</div>
					<div class="form-group row buttons-container">
						<div class="col-lg-4 col-xs-4">
							<button type="button" class="btn btn-block clear-btn"><fmt:message key="application.input.clear"/></button>
						</div>
						<div class="col-lg-4 col-lg-push-4 col-xs-4 col-xs-push-4">
							<button type="button" class="btn btn-block analysis-btn"><fmt:message key="application.input.analyze"/></button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-xs-12">
				<div style="display: none;"
					class="form-group row loading text-center loading">
					<h2>&nbsp;</h2>
					<img src="images/watson.gif">
				</div>
				<div style="display: none;" class="form-group row error">
					<h2>&nbsp;</h2>
					<div class="well">
						<p class="errorMsg"></p>
					</div>
				</div>
				<div style="display: none;" class="results">
					<h2><fmt:message key="application.label.yourPersonality"/>*</h2>
					<div class="well">
						<div class="summary-div"></div>
						<div style="color: gray" class="text-right">
							<em class="small">*<fmt:message key="application.label.comparedFootnote"/></em>
						</div>
						<div style="color: gray" class="text-right">
							<em class="small outputWordCountMessage"></em>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="results">
				<div class="row">
					<div class="col-lg-5 col-md-12 col-xs-12">
						<h3><fmt:message key="application.label.personalityData"/></h3>
						<div style="display: none;" class="col555px well traits"></div>
					</div>
					<div class="col-lg-7 col-xs-12 col-md-12">
						<h3><fmt:message key="application.label.personalityVisualizationData"/></h3>
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
							<span><fmt:message key="application.label.value"/> ± <fmt:message key="application.label.samplingError"/></span>
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
    <script type="text/javascript" src="js/string-utils.js"></script>
    <script type="text/javascript" src="js/i18n.js"></script>
	<script type="text/javascript" src="js/textsummary.js"></script>
    <script type="text/javascript">
        textSummary.init('json');
    </script>
</body>
</html>