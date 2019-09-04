<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>ECO COFFEE - BEST CAFE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- alert한글깨짐현상방지 -->
<script src="../resources/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway:300);

@import url(http://fonts.googleapis.com/css?family=Open+Sans);

html {
	font-family: sans-serif;
}

body {
	font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #3e4855;
	background-color: #fff;
	line-height: 1.42857143;
	overflow-x: hidden;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.container {
	display: block;
	margin-right: auto;
	margin-left: auto;
}

#page-title {
	padding: 0 0 23px;
	position: relative;
}

#page-title>h2 {
	font-family: "Raleway", "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: 300;
	font-size: 22px;
	text-transform: uppercase;
	padding: 0;
	margin: 0;
	color: #414C59;
}

.row {
	box-sizing: border-box;
	margin-right: -10px;
	margin-left: -10px;
}

.panel {
	border-color: #dfe8f1;
	margin-bottom: 20px;
	border-width: 1px;
	border-style: solid;
	border-radius: 4px;
	background-color: #fff;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.panel-body {
	padding: 15px 20px;
	position: relative;
}

.form-group, .bordered-row {
	border-color: #dfe8f1;
}

.bordered-row>.form-group {
	padding: 20px 0;
	margin-bottom: 0;
	border-top-width: 1px;
	border-top-style: dashed;
}

.form-horizontal>.form-group {
	margin-right: -15px;
	margin-left: -15px;
}

.form-control, canvas {
	border-radius: 3px;
	font-size: 13px;
	display: block;
	float: none;
	background: #fff;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	color: #2b2f33;
	border: #dfe8f1 solid 1px;
	box-shadow: inset 1px 1px 3px #f6f6f6;
}

input {
	line-height: normal;
	font-family: inherit;
}

[class*='col-'] {
	box-sizing: border-box;
}

.col-sm-3 {
	position: relative;
	min-height: 1px;
	padding-right: 10px;
	padding-left: 10px;
}

label {
	color: #3e4855;
	font-weight: bold;
	display: inline-block;
}

*, *:before, *:after {
	box-sizing: border-box;
}

h2 {
	display: block;
	-webkit-margin-before: 0.83em;
	-webkit-margin-after: 0.83em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

.btn-link:hover {
	background-color: transparent;
	box-shadow: none;
	cursor: pointer;
}

.btn-border:hover span {
	text-decoration: none;
	opacity: .75;
	border-width: 2px;
	border-style: solid;
}

.btn-alt {
	font-weight: bold;
	text-transform: uppercase;
	font-size: 12px;
}

.btn, cavas>button {
	border-radius: 3px;
	line-height: 32px;
	height: 34px;
	min-width: 34px;
	position: relative;
	display: inline-block;
	padding: 0 12px;
	user-select: none;
	text-align: center;
	white-space: nowrap;
	background-image: none;
	-webkit-transition: all .1s ease-in-out;
}

.border-green {
	border-color: #2ecc71 !important;
}

.text-success, .font-green {
	color: #2ecc71 !important;
}

a:link, a:hover, a:visited {
	text-decoration: none;
	outline: none;
}
</style>

</head>
<body>
	<br>
	<div class="container" align="center" style="background: white;">
		<div class="row" style="background: white;">
			<div class="panel">
				<div class="panel-body">
					<div class="example-box-wrapper">
						<form id="collectForm" name="collectForm"
							class="form-horizontal bordered-row">
							<img src="../resources/image/best.jpg" style="width: 40%"><br>
							<div class="form-group">
								<label class="col-sm-3">CAFE NAME</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="resernum"
										value="${member.name}" name="resernum" readonly="readonly">
								</div>
							</div>

							<div class="form-group" style="display: block">
								<label class="col-sm-3">CAFE TEL</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="cafeid"
										value="${member.tel}" name="cafeid" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3">CAFE POST CODE</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="cafename"
										value="${member.postcode}" name="cafename" readonly="readonly">
								</div>
							</div>

							<div class="form-group" style="display: block">
								<label class="col-sm-3">CAFE ROAD ADDRESS</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="businessid"
										value="${member.road}" name="businessid" readonly="readonly">
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group" style="text-align: center;">
		<input type='button'
			class="save btn btn-border btn-alt border-green btn-link font-green"
			value="CLOSE" onClick='window.close()'>
	</div>

</body>
</html>