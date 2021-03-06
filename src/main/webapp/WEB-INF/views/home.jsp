<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Monitor">
<meta name="author" content="Dhairya Sanghvi">

<title>CCIX to LAE Migration - Home</title>

<!-- Set the icon for the browser tab -->
<link type="image/x-icon" rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/settings_icon.png">

<!-- Java Scripts -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
	rel='stylesheet' type='text/css' />
<link href='https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css">
<link rel="stylesheet"
	href="https://kendo.cdn.telerik.com/2015.3.930/styles/kendo.default.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css">

<script
	src="https://kendo.cdn.telerik.com/2015.3.930/js/kendo.all.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.navigation').removeClass("active")
		$('#navHome').addClass("active")
	});

	$(document)
			.ready(
					function() {
						var categories = $("#categories")
								.kendoDropDownList(
										{
											optionLabel : "Select Service Offering...",
											dataTextField : "CategoryName",
											dataValueField : "CategoryID",
											dataSource : {
												type : "odata",
												serverFiltering : true,
												transport : {
													read : "//demos.telerik.com/kendo-ui/service/Northwind.svc/Categories"
												}
											}
										}).data("kendoDropDownList");

						var products = $("#products")
								.kendoDropDownList(
										{
											autoBind : false,
											cascadeFrom : "categories",
											optionLabel : "Select App...",
											dataTextField : "ProductName",
											dataValueField : "ProductID",
											dataSource : {
												type : "odata",
												serverFiltering : true,
												transport : {
													read : "//demos.telerik.com/kendo-ui/service/Northwind.svc/Products"
												}
											}
										}).data("kendoDropDownList");

						$("#get")
								.click(
										function() {
											var categoryInfo = "\nCategory: { id: "
													+ categories.value()
													+ ", name: "
													+ categories.text() + " }", productInfo = "\nProduct: { id: "
													+ products.value()
													+ ", name: "
													+ products.text() + " }";

										});
					});

	function toggle_visibility(id) {
		var e = document.getElementById(id);
		if (e.style.display == 'block')
			e.style.display = 'none';
		else
			e.style.display = 'block';
	}
</script>
</head>
<div>
	<nav class="navbar navbar-inverse navbar-static-top"
		style="background: -moz-linear-gradient(#646464, #323232); background: -webkit-linear-gradient(#646464, #323232); background: linear-gradient(#646464, #323232); background: -o-linear-gradient(#646464, #323232); background-color: #323232;">
		<div class="container-fluid">
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 navbar-header">
				<a class="navbar-brand pull-left" style="padding: 12px;"
					href="${pageContext.request.contextPath}/"> <img
					src="${pageContext.request.contextPath}/resources/images/ciscologo.png"
					height=25px; width="50px;" />
				</a>
			</div>
			<div class="col-lg-5 col-md-5 hidden-sm hidden-xs navbar-header"
				style="margin-left: -53%;">
				<a class="navbar-brand"
					style="color: white; font-family: 'Raleway', sans-serif; font-weight: none; font-size: 20px;"
					href="${pageContext.request.contextPath}/"> CCIX to LAE
					Migration Dashboard </a>
			</div>
			<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 navbar-header"
				style="margin-top: -3.5%; margin-left: 42%; color: white;">
				<a class="navbar-brand pull-right"
					href="${pageContext.request.contextPath}/"
					style="color: #E6E6E6; font-family: 'Raleway', sans-serif; font-size: 15px;">
					dhsanghv&nbsp;&nbsp;<span class="glyphicon glyphicon-cog"
					style="margin-top: 1%; color: #E6E6E6;"></span>
				</a>
			</div>
		</div>
	</nav>

	<nav class="navbar navbar-default">
		<div class="container-fluid maxScreenSize">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".search">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div id="navbar">
				<div class="col-lg-8 col-md-6 col-sm-4 col-xs-12">
					<ul class="nav navbar-nav">

						<spring:url value="/home" var="goToHome">
						</spring:url>
						<li id="navHome" class="navigation"><a href="${goToHome}"
							style="font-family: 'Raleway', sans-serif;">Submit Plan</a></li>

						<spring:url value="/edit" var="goToEdit">
						</spring:url>
						<li id="navEdit" class="navigation"><a href="${goToEdit}"
							style="font-family: 'Raleway', sans-serif;">Edit Plan</a></li>

						<spring:url value="/view" var="goToView">
						</spring:url>
						<li id="navView" class="navigation"><a href="${goToView}"
							style="font-family: 'Raleway', sans-serif;">View Reports</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-8 col-xs-12"
				style="padding-top: 7px; padding-left: 208px;">
				<a href="http://lae-mig.cloudapps.cisco.com/index.cgi" role="button"
					class="btn btn-warning"
					style="margin-left: 30px; border-color: #AAB0AF; background-color: #fff; color: #6E6E6E; font-family: 'Raleway', sans serif; font-size: 14px;"><img
					src="${pageContext.request.contextPath}/resources/images/settings_icon.png"
					width="20px" height="20px" />&nbsp;CCIX-LAE Migration Tool</a>
			</div>
		</div>
	</nav>
</div>
<br>

<div class="page_body">

	<div class="page_body_title">Submit your Commitment Plan</div>
	<br>
	<div class="page_body_left">
		<div class="demo-section k-content">

			<h5>Service Offering:</h5>
			<input id="categories" style="width: 50%; font-size: 13px;" />

			<h5 style="margin-top: 1.5em;">Application/JVM:</h5>
			<input id="products" disabled="disabled"
				style="width: 50%; font-size: 13px;" /> <br>
			<button class="k-button k-primary" id="get"
				onclick="toggle_visibility('toggler');"
				style="margin-top: 2em; float: left; font-size: 13px;">Get
				Started</button>

		</div>
	</div>
	<div class="page_body_right">
		<div class="container-fluid" id="toggler" style="display: none;">
			<h3 style="margin-left: -70px; font-weight: bolder;">
				App Name: <font color="#346581">batsin</font>
				<hr>
			</h3>
			<br>
			<form class="form-horizontal" style="margin-left: -150px;">
				<div class="form-group">
					<label class="control-label col-sm-2">Organization</label>
					<div class="col-md-4">
						<input type="text" class="form-control"
							value="Communication and Collaboration IT" readonly>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-2">SVP</label>
					<div class="col-md-4">
						<input type="text" class="form-control" value="V C Gopalratnam"
							readonly>
					</div>
					<label class="control-label col-sm-1">Director</label>
					<div class="col-md-4">
						<input type="text" class="form-control" value="Bailey Szeto"
							readonly>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-2">POCs</label>
					<div class="col-md-4">
						<input type="text" class="form-control">
					</div>
					<label class="control-label col-sm-2">EMAN Priority</label>
					<div class="col-md-3">
						<input type="text" class="form-control" value="P2" readonly>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-2">Migration Date</label>
					<div class="col-md-2">
						<div id="datepicker" class="input-group date"
							data-date-format="mm-dd-yyyy">
							<input class="form-control" type="text" /> <span
								class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
				</div>
				<br>
				<button type="button" class="btn btn-primary"
					style="margin-left: 550px;">Submit</button>
			</form>

		</div>
	</div>
</div>

<br>
<br>
<div>
	<nav class="navbar navbar-default navbar-fixed-bottom"
		role="navigation">
		<a href="${pageContext.request.contextPath}/"> <img
			style="margin-top: 12px; float: left; margin-left: 20px;"
			src="${pageContext.request.contextPath}/resources/images/ciscologo_grey.png"
			width="50px" height="25px" />
		</a>
		<ul class="nav navbar-nav navbar-left"
			style="left: 83%; position: relative;">
			<li><a
				href="mailto:lae-operations@cisco.com?Subject=CCIX%20to%20LAE%20Migration%20Support"
				target="_top" style="font-family: 'Raleway', sans-serif;"> <font
					size="2px;" color="#AEB1B1"> Contact Us </font></a></li>
			<li><a href="#" style="font-family: 'Raleway', sans-serif;"><font
					size="2px;" color="#AEB1B1">About</font></a></li>
		</ul>
	</nav>
</div>

<script>
	$(function() {
		$("#datepicker").datepicker({
			autoclose : true,
			todayHighlight : true
		}).datepicker();
		;
	});
</script>
