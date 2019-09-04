<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String gc = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- layout css 새로 적용 -->
<head>
<style>
/* Loading Spinner */
.spinner {
	margin: 0;
	width: 70px;
	height: 18px;
	margin: -35px 0 0 -9px;
	position: absolute;
	top: 50%;
	left: 50%;
	text-align: center
}

.spinner>div {
	width: 18px;
	height: 18px;
	background-color: #333;
	border-radius: 100%;
	display: inline-block;
	-webkit-animation: bouncedelay 1.4s infinite ease-in-out;
	animation: bouncedelay 1.4s infinite ease-in-out;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both
}

.spinner .bounce1 {
	-webkit-animation-delay: -.32s;
	animation-delay: -.32s
}

.spinner .bounce2 {
	-webkit-animation-delay: -.16s;
	animation-delay: -.16s
}

@
-webkit-keyframes bouncedelay { 0%,80%,100%{
	-webkit-transform: scale(0.0)
}

40%{
-webkit-transform
:scale
(1
.0
)
}
}
@
keyframes bouncedelay { 0%,80%,100%{
	transform: scale(0.0);
	-webkit-transform: scale(0.0)
}
40%{
transform
:scale
(1
.0
);-webkit-transform
:scale
(1
.0
)
}
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECO COFFEE - ECO MILEAGE</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>

<!-- 순위 css, js -->

<link href="../resources/css/stylesheet.css" media="screen" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="../resources/js/application.js" type="text/javascript"></script>

<!-- Favicons -->
<link rel="shortcut icon"
	href="../resources/assets/images/icons/favicon.png">

<!--instagram-->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/instagram.css">

<!-- HELPERS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/animate.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/backgrounds.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/boilerplate.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/border-radius.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/grid.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/page-transitions.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/spacing.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/typography.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/utils.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/colors.css">

<!-- ELEMENTS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/badges.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/buttons.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/content-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/dashboard-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/forms.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/images.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/info-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/invoice.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/loading-indicators.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/menus.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/panel-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/response-messages.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/responsive-tables.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/ribbon.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/social-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/tables.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/tile-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/elements/timeline.css">

<!-- FRONTEND ELEMENTS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/footer.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/blog.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/cta-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/feature-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/hero-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/icon-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/portfolio-navigation.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/pricing-table.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/sliders.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/frontend-elements/testimonial-box.css">

<!-- ICONS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/icons/fontawesome/fontawesome.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/icons/linecons/linecons.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/icons/spinnericon/spinnericon.css">

<!-- WIDGETS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/accordion-ui/accordion.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/calendar/calendar.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/carousel/carousel.css">

<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/charts/justgage/justgage.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/charts/morris/morris.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/charts/piegage/piegage.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/charts/xcharts/xcharts.css">

<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/chosen/chosen.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/colorpicker/colorpicker.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/datatable/datatable.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/datepicker/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/datepicker-ui/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/daterangepicker/daterangepicker.css">

<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/dialog/dialog.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/dropdown/dropdown.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/dropzone/dropzone.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/file-input/fileinput.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/input-switch/inputswitch.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/input-switch/inputswitch-alt.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/ionrangeslider/ionrangeslider.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/jcrop/jcrop.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/jgrowl-notifications/jgrowl.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/loading-bar/loadingbar.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/maps/vector-maps/vectormaps.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/markdown/markdown.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/modal/modal.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/multi-select/multiselect.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/multi-upload/fileupload.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/nestable/nestable.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/noty-notifications/noty.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/popover/popover.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/pretty-photo/prettyphoto.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/progressbar/progressbar.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/range-slider/rangeslider.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/slidebars/slidebars.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/slider-ui/slider.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/tabs-ui/tabs.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/theme-switcher/themeswitcher.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/timepicker/timepicker.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/tocify/tocify.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/tooltip/tooltip.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/touchspin/touchspin.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/uniform/uniform.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/wizard/wizard.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/xeditable/xeditable.css">

<!-- FRONTEND WIDGETS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/layerslider/layerslider.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/owlcarousel/owlcarousel.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/widgets/fullpage/fullpage.css">

<!-- SNIPPETS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/chat.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/files-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/login-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/notification-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/progress-box.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/todo.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/user-profile.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/snippets/mobile-navigation.css">

<!-- APPLICATIONS -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/applications/mailbox.css">

<!-- Admin theme -->

<link rel="stylesheet" type="text/css"
	href="../resources/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/themes/admin/layout.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/themes/admin/color-schemes/default.css">

<!-- Frontend theme -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/themes/frontend/layout.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/themes/frontend/color-schemes/default.css">

<!-- Components theme -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/themes/components/default.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/themes/components/border-radius.css">

<!-- Admin responsive -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/responsive-elements.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/admin-responsive.css">

<!-- Frontend responsive -->

<link rel="stylesheet" type="text/css"
	href="../resources/assets/helpers/responsive-elements.css">
<link rel="stylesheet" type="text/css"
	href="../resources//assets/helpers/frontend-responsive.css">

<!-- JS Core -->

<script type="text/javascript"
	src="../resources/assets/js-core/jquery-core.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/jquery-ui-core.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/jquery-ui-widget.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/jquery-ui-mouse.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/jquery-ui-position.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/transition.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/modernizr.js"></script>
<script type="text/javascript"
	src="../resources/assets/js-core/jquery-cookie.js"></script>

<script type="text/javascript">
	$(window).load(function() {
		setTimeout(function() {
			$('#loading').fadeOut(400, "linear");
		}, 300);
	});
</script>

</head>

<body>
	<div id="loading">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>

	<div id="page-wrapper">
		<div class="top-bar bg-topbar">
			<div class="container">
				<div class="float-left" style="margin: auto">
					<div style="clear: both"></div>
					<img src="../resources/image/best1.jpg" width="150">

					<div id="content">
						<dl id="rank-list">
							<dd>
								<ol>
									<li><h3 class="thumb-heading">1ST : ${cafe1}</h3></li>
									<li><h3 class="thumb-heading">2ND : ${cafe2}</h3></li>
									<li><h3 class="thumb-heading">3RD : ${cafe3}</h3></li>
								</ol>
							</dd>
						</dl>
					</div>
				</div>
				<div class="float-right user-account-btn dropdown"
					style="padding-top: 20px;">
					<div class="user-profile clearfix">

						<c:if test="${loginId == null}">
						<img width="30" src="../resources/assets/image-resources/coo.JPG">
							<a href="<%=gc%>/member/login"
								class="btn btn-sm float-left btn-alt btn-hover mrg10R btn-default">
								<span>LOGIN</span> <i class="glyph-icon icon-arrow-right"></i>
							</a>
							<a href="<%=gc%>/member/join"
								class="btn btn-sm float-left btn-alt btn-hover mrg10R btn-default">
								<span>JOIN</span> <i class="glyph-icon icon-arrow-right"></i>
							</a>
						</c:if>

						<c:if test="${loginId != null}">
							<a href="<%=gc%>/member/logout"
								class="btn btn-sm float-right btn-alt btn-hover mrg10R btn-default">
								<span>LOGOUT</span> <i class="glyph-icon icon-arrow-right"></i>
							</a>
							<a href="<%=gc%>/member/myPage"
								class="btn btn-sm float-right btn-alt btn-hover mrg10R btn-default">
								<span>MY PAGE</span> <i class="glyph-icon icon-arrow-right"></i>
							</a>
            &nbsp;<span>${sessionScope.loginName}&nbsp;(${sessionScope.loginId})님&nbsp;&nbsp;</span>&nbsp;
               <c:if test="${division == 'business'}">
								<img width="30" src="../resources/assets/image-resources/co.jpg">
								<a href="<%=gc%>/mailbox1"> <span><img
										src="../resources/assets/images/icons/message.jpg" width="28"></span>
								</a>
							</c:if>
							<c:if test="${division == 'cafe'}">
								<img width="28"
									src="../resources/assets/image-resources/gravatar.jpg">
								<a href="<%=gc%>/notreadmsg"> <span><img
										src="../resources/assets/images/icons/message.jpg" width="28"></span>
								</a>
								<c:if test="${count>10}">
									<span><img src="../resources/image/bmark.jpg" width="30"></span>
								</c:if>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
			<!-- .container -->
		</div>
		<!-- .top-bar -->
	</div>

	<div class="main-header bg-header wow fadeInDown">
		<div class="container">
			<a href="<%=gc%>/mainHome" class="header-logo"></a>
			<!-- .header-logo -->
			<div class="right-header-btn">
				<div id="mobile-navigation">
					<button id="nav-toggle" class="collapsed" data-toggle="collapse"
						data-target=".header-nav">
						<span></span>
					</button>
				</div>
			</div>
			<!-- .header-logo -->
			<ul class="header-nav collapse">
				<li><a href="#"> INTRODUCE <i
						class="glyph-icon icon-angle-down"></i>
				</a>
					<ul>
						<li><a href="<%=gc%>/menu/homepage"><span>OUR TEAM</span></a></li>
						<li><a href="<%=gc%>/menu/waste"><span>COFFEE
									WASTE</span></a></li>
						<li><a href="<%=gc%>/menu/service"><span>ECO
									MILEAGE</span></a></li>
					</ul></li>
				<li><a href="#"> CAFE <i
						class="glyph-icon icon-angle-down"></i>
				</a>
					<ul>
						<li><a href="<%=gc%>/menu/cafe1"><span>FRANCHISE CAFE</span></a></li>
						<li><a href="<%=gc%>/menu/cafe2"><span>COMMON CAFE</span></a></li>
						<li><a href="<%=gc%>/memberMap/map1"><span>MAP</span></a></li>
						<li><a href="<%=gc%>/chart/graph1"><span>GRAPH</span></a></li>
					</ul></li>
				<li><a href="#"> PICKUP COMPANY <i
						class="glyph-icon icon-angle-down"></i>
				</a>
					<ul class="footer-nav">
						<li><a href="<%=gc%>/memberMap/map2"><span>MAP</span></a></li>
						<li><a href="<%=gc%>/chart/graph2"><span>GRAPH</span></a></li>
					</ul></li>
				<li><a href="#"> RESERVATION <i
						class="glyph-icon icon-angle-down"></i>
				</a>
					<ul>
						<li><a href="<%=gc%>/menu/schedule"><span>RESERVATION</span></a></li>
						<li><a href="<%=gc%>/menu/confirm"><span>RESULT CONFIRM</span></a></li>
					</ul></li>
				<li><a href="<%=gc%>/menu/product"> PRODUCT </a></li>
			</ul>
			<!-- .header-nav -->
		</div>
		<!-- .container -->
	</div>
	<!-- .main-header -->

	<!-- Lazyload -->

	<script type="text/javascript"
		src="../resources/assets/widgets/lazyload/lazyload.js"></script>
	<script type="text/javascript">
		/* Lazyload */

		$(function() {
			$("img.lazy").lazyload({
				effect : "fadeIn",
				threshold : 100
			});
		});
	</script>

	<div class="hero-box hero-box-smaller full-bg-13 font-inverse"
		data-top-bottom="background-position: 50% 0px;"
		data-bottom-top="background-position: 50% -600px;">

		<div class="container">
			<h1 class="hero-heading wow fadeInDown" data-wow-duration="0.6s">ECO
				Coffee</h1>
			<p class="hero-text wow bounceInUp" data-wow-duration="0.9s"
				data-wow-delay="0.2s">Let's recycle the wasted coffee and help
				the economy!</p>
		</div>
		<div class="hero-overlay bg-black"></div>
	</div>
	<div id="page-content" class="container mrg25T"
		style="background: white;">
		<div class="row">
			<div class="col-md-9">
				<h3 class="p-title1">
					<span>에코마일리지 카드</span>
				</h3>
				<br>
				<div class="blog-box blog-box-alt row">
					<div class="post-image">
						<img class="img-responsive lazy"
							style="margin: 0 auto; width: 90%; height: 90%;"
							data-original="../resources/assets/image-resources/stock-images/img-07.JPG">
					</div>
					<div class="post-image">
						<img class="img-responsive lazy"
							style="margin: 0 auto; width: 90%; height: 90%;"
							data-original="../resources/assets/image-resources/stock-images/img-08.JPG">
					</div>
				</div>
				<div class="blog-box blog-box-alt row">
					<div class="post-content-wrapper">
						<a class="post-title">
							<h4>에코마일리지 카드 포인트 적립</h4>
							<br>
						</a>
					</div>
					<div class="post-image">
						<img class="img-responsive lazy"
							style="margin: 0 auto; width: 90%; height: 90%;"
							data-original="../resources/assets/image-resources/stock-images/img-09.JPG">
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="content-box">
					<h3 class="content-box-header bg-default">HOMEPAGE</h3>
					<div class="posts-list content-box-wrapper">
						<ul>
							<li>
								<div class="post-image">
									<img class="img-responsive lazy"
										src="../resources/assets/image-resources/stock-images/img-48.JPG">
								</div>
								<div class="post-body">
									<a class="post-title"
										href="http://ecomileage.seoul.go.kr/home/index.do"
										target="_blank">
										<h3>SEOUL ECO MILEAGE</h3>
									</a>
									<p>서울시 에코 마일리지 홈페이지</p>
								</div>
							</li>
							<li>
								<div class="post-image">
									<img class="img-responsive lazy"
										src="../resources/assets/image-resources/stock-images/img-47.jpg">
								</div>
								<div class="post-body">
									<a class="post-title"
										href="https://www.facebook.com/ecomileage" target="_blank">
										<h3>ECO MILEAGE FACEBOOK</h3>
									</a>
									<p>서울시 에코 마일리지 페이스북</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="list-group mrg20B">
					<a href="<%=gc%>/menu/service" class="list-group-item"> <i
						class="glyph-icon font-red icon-bullhorn"></i> 에코마일리지 <i
						class="glyph-icon font-green icon-chevron-right"></i>
					</a> <a href="<%=gc%>/menu/eco1" class="list-group-item"> <i
						class="glyph-icon font-red icon-bullhorn"></i> 에코마일리지 필요성 <i
						class="glyph-icon font-green icon-chevron-right"></i>
					</a> <a href="<%=gc%>/menu/eco2" class="list-group-item"> <i
						class="glyph-icon icon-dashboard"></i> 에코마일리지 지급안내 <i
						class="glyph-icon font-green icon-chevron-right"></i>
					</a> <a href="<%=gc%>/menu/eco3" class="list-group-item"> <i
						class="glyph-icon icon-dashboard"></i> 에코마일리지 사용방법 <i
						class="glyph-icon font-green icon-chevron-right"></i>
					</a> <a href="<%=gc%>/menu/eco4" class="list-group-item"> <i
						class="glyph-icon font-blue-alt icon-globe"></i> 에코마일리지 카드 <i
						class="glyph-icon font-green icon-chevron-right"></i>
					</a> <a href="<%=gc%>/menu/eco5" class="list-group-item"> <i
						class="glyph-icon font-blue-alt icon-globe"></i> 생활 속 에코실천 <i
						class="glyph-icon font-green icon-chevron-right"></i>
					</a>
				</div>
				<div class="content-box">
					<h3 class="content-box-header bg-default">Instagram - Hash
						Tags</h3>
					<div class="content-box-wrapper clearfix tags-list">
						<a
							href="https://www.instagram.com/explore/tags/%EC%97%90%EC%BD%94%EB%A7%88%EC%9D%BC%EB%A6%AC%EC%A7%80/?hl=ko"
							target="_blank" class="bs-label label-black">#에코마일리지</a> <a
							href="https://www.instagram.com/explore/tags/%EC%97%90%EC%BD%94/?hl=ko"
							target="_blank" class="bs-label label-black">#에코</a> <a
							href="https://www.instagram.com/explore/tags/eco/?hl=ko"
							target="_blank" class="bs-label label-success">#ECO</a> <a
							href="https://www.instagram.com/explore/tags/ecomileage/?hl=ko"
							target="_blank" class="bs-label label-warning">#ECOMILEAGE</a> <a
							href="https://www.instagram.com/explore/tags/%E3%82%A8%E3%82%B3%E3%83%BC/?hl=ko"
							target="_blank" class="bs-label label-success">#エコー</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>

	<div class="main-footer bg-gradient-4 clearfix">
		<!--assets/helpers/backgrounds.css-->
		<div class="footer-pane">
			<div class="container clearfix">
				<div class="logo">&copy; 2017 SCIT 33rd A Class ECO COFFEE All
					Rights Reserved.</div>
				<div class="footer-nav-bottom">
					Contact us.&nbsp;&nbsp; <i class="glyph-icon icon-envelope-o"></i>
					<a href="https://www.instagram.com/coffeerecycle/" target="_blank">Instagram
						Message</a>
				</div>
			</div>
		</div>
	</div>

	<!-- FRONTEND ELEMENTS -->


	<!-- Skrollr -->

	<script type="text/javascript"
		src="../resources/assets/widgets/skrollr/skrollr.js"></script>

	<!-- Owl carousel -->

	<script type="text/javascript"
		src="../resources/assets/widgets/owlcarousel/owlcarousel.js"></script>
	<script type="text/javascript"
		src="../resources/assets/widgets/owlcarousel/owlcarousel-demo.js"></script>

	<!-- HG sticky -->

	<script type="text/javascript"
		src="../resources/assets/widgets/sticky/sticky.js"></script>

	<!-- WOW -->

	<script type="text/javascript"
		src="../resources/assets/widgets/wow/wow.js"></script>

	<!-- VideoBG -->

	<script type="text/javascript"
		src="../resources/assets/widgets/videobg/videobg.js"></script>
	<script type="text/javascript"
		src="../resources/assets/widgets/videobg/videobg-demo.js"></script>

	<!-- Mixitup -->

	<script type="text/javascript"
		src="../resources/assets/widgets/mixitup/mixitup.js"></script>
	<script type="text/javascript"
		src="../resources/assets/widgets/mixitup/isotope.js"></script>

	<!-- WIDGETS -->

	<!-- Bootstrap Dropdown -->

	<script type="text/javascript"
		src="../resources/assets/widgets/dropdown/dropdown.js"></script>

	<!-- Bootstrap Tooltip -->

	<script type="text/javascript"
		src="../resources/assets/widgets/tooltip/tooltip.js"></script>

	<!-- Bootstrap Popover -->

	<script type="text/javascript"
		src="../resources/assets/widgets/popover/popover.js"></script>

	<!-- Bootstrap Progress Bar -->

	<script type="text/javascript"
		src="../resources/assets/widgets/progressbar/progressbar.js"></script>

	<!-- Bootstrap Buttons -->

	<script type="text/javascript"
		src="../resources/assets/widgets/button/button.js"></script>

	<!-- Bootstrap Collapse -->

	<script type="text/javascript"
		src="../resources/assets/widgets/collapse/collapse.js"></script>

	<!-- Superclick -->

	<script type="text/javascript"
		src="../resources/assets/widgets/superclick/superclick.js"></script>

	<!-- Input switch alternate -->

	<script type="text/javascript"
		src="../resources/assets/widgets/input-switch/inputswitch-alt.js"></script>

	<!-- Slim scroll -->

	<script type="text/javascript"
		src="../resources/assets/widgets/slimscroll/slimscroll.js"></script>

	<!-- Content box -->

	<script type="text/javascript"
		src="../resources/assets/widgets/content-box/contentbox.js"></script>

	<!-- Overlay -->

	<script type="text/javascript"
		src="../resources/assets/widgets/overlay/overlay.js"></script>

	<!-- Widgets init for demo -->

	<script type="text/javascript"
		src="../resources/assets/js-init/widgets-init.js"></script>
	<script type="text/javascript"
		src="../resources/assets/js-init/frontend-init.js"></script>

	<!-- Theme layout -->

	<script type="text/javascript"
		src="../resources/assets/themes/frontend/layout.js"></script>

	<!-- Theme switcher -->

	<script type="text/javascript"
		src="../resources/assets/widgets/theme-switcher/themeswitcher.js"></script>

</body>
</html>