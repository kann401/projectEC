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
/* 카페의 best 마크 */
.bestcafe {
	height: 100px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECO COFFEE - BEST CAFE</title>

<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

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

<style type="text/css">
.owl-item {
	float: left;
}
</style>

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

<script>
	
<%-- 각 지점 이미지 클릭시에 밑에 추가될 상세페이지를 불러오는 함수--%>
	function opendetail1() {
		var detail1 = '<div class="container">';
		detail1 += '<h3 class="p-title"><span>ESKIMO 코엑스몰점</span></h3>';
		detail1 += '<p style = "text-align: center;">에스키모의 다양한 음료와 타르트를 만나보세요.<br><br></p>';
		detail1 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail1 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail1 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail1 += '<img src="../resources/image/img-04.JPG"></div></div></div></div>';
		detail1 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail1 += '<img src="../resources/image/img-05.JPG"></div></div></div></div>';
		detail1 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail1 += '<img src="../resources/image/img-06.JPG"></div></div></div></div>';
		detail1 += '</div></div></div>';
		detail1 += '<h3 class="p-title"></h3></div></div>';
		detail1 += '</div>';

		$(function() {
			$('.opendetail').html(detail1);
		});
	}

	function opendetail2() {
		var detail2 = '<div class="container">';
		detail2 += '<h3 class="p-title"><span>카페루미</span></h3>';
		detail2 += '<p style = "text-align: center;">카페루미에서 2시간 동안 다양한 먹거리와 룸카페를 즐겨보세요.<br><br></p>';
		detail2 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail2 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail2 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail2 += '<img src="../resources/image/img-01.jpg"></div></div></div></div>';
		detail2 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail2 += '<img src="../resources/image/img-02.jpg"></div></div></div></div>';
		detail2 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail2 += '<img src="../resources/image/img-03.jpg"></div></div></div></div>';
		detail2 += '</div></div></div>';
		detail2 += '<h3 class="p-title"></h3></div></div>';
		detail2 += '</div>';

		$(function() {
			$('.opendetail').html(detail2);
		});
	}
	function opendetail3() {
		var detail3 = '<div class="container">';
		detail3 += '<h3 class="p-title"><span>뉴코피커피</span></h3>';
		detail3 += '<p style = "text-align: center;">뉴코피커피에서 다양한 커피와 눈꽃빙수를 만나보세요.<br><br></p>';
		detail3 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail3 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail3 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail3 += '<img src="../resources/image/img-25.jpg"></div></div></div></div>';
		detail3 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail3 += '<img src="../resources/image/img-26.jpg"></div></div></div></div>';
		detail3 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail3 += '<img src="../resources/image/img-27.JPG"></div></div></div></div>';
		detail3 += '</div></div></div>';
		detail3 += '<h3 class="p-title"></h3></div></div>';
		detail3 += '</div>';

		$(function() {
			$('.opendetail').html(detail3);
		});
	}
	function opendetail4() {
		var detail4 = '<div class="container">';
		detail4 += '<h3 class="p-title"><span>하바나</span></h3>';
		detail4 += '<p style = "text-align: center;">하나바에서 다양한 커피를 만나보세요.<br><br></p>';
		detail4 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail4 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail4 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail4 += '<img src="../resources/image/img-31.JPG"></div></div></div></div>';
		detail4 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail4 += '<img src="../resources/image/img-32.JPG"></div></div></div></div>';
		detail4 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail4 += '<img src="../resources/image/img-33.JPG"></div></div></div></div>';
		detail4 += '</div></div></div>';
		detail4 += '<h3 class="p-title"></h3></div></div>';
		detail4 += '</div>';

		$(function() {
			$('.opendetail').html(detail4);
		});
	}
	function opendetail5() {
		var detail5 = '<div class="container">';
		detail5 += '<h3 class="p-title"><span>카페메이트</span></h3>';
		detail5 += '<p style = "text-align: center;">카페메이트에서 다양한 커피를 만나보세요.<br><br></p>';
		detail5 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail5 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail5 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail5 += '<img src="../resources/image/img-34.JPG"></div></div></div></div>';
		detail5 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail5 += '<img src="../resources/image/img-35.JPG"></div></div></div></div>';
		detail5 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail5 += '<img src="../resources/image/img-36.JPG"></div></div></div></div>';
		detail5 += '</div></div></div>';
		detail5 += '<h3 class="p-title"></h3></div></div>';
		detail5 += '</div>';

		$(function() {
			$('.opendetail').html(detail5);
		});
	}
	function opendetail6() {
		var detail6 = '<div class="container">';
		detail6 += '<h3 class="p-title"><span>에이블</span></h3>';
		detail6 += '<p style = "text-align: center;">에이블에서 다양한 브런치 메뉴를 만나보세요.<br><br></p>';
		detail6 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail6 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail6 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail6 += '<img src="../resources/image/img-37.JPG"></div></div></div></div>';
		detail6 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail6 += '<img src="../resources/image/img-38.JPG"></div></div></div></div>';
		detail6 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail6 += '<img src="../resources/image/img-39.JPG"></div></div></div></div>';
		detail6 += '</div></div></div>';
		detail6 += '<h3 class="p-title"></h3></div></div>';
		detail6 += '</div>';

		$(function() {
			$('.opendetail').html(detail6);
		});
	}
	function opendetail7() {
		var detail7 = '<div class="container">';
		detail7 += '<h3 class="p-title"><span>B ROAD</span></h3>';
		detail7 += '<p style = "text-align: center;">B ROAD에서 다양한 음식과 음료를 만나보세요.<br><br></p>';
		detail7 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail7 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail7 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail7 += '<img src="../resources/image/img-40.JPG"></div></div></div></div>';
		detail7 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail7 += '<img src="../resources/image/img-41.JPG"></div></div></div></div>';
		detail7 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail7 += '<img src="../resources/image/img-42.JPG"></div></div></div></div>';
		detail7 += '</div></div></div>';
		detail7 += '<h3 class="p-title"></h3></div></div>';
		detail7 += '</div>';

		$(function() {
			$('.opendetail').html(detail7);
		});
	}
	function opendetail8() {
		var detail8 = '<div class="container">';
		detail8 += '<h3 class="p-title"><span>자판기</span></h3>';
		detail8 += '<p style = "text-align: center;">자판기에서 다양한 커피와 밀크티를 만나보세요.<br><br></p>';
		detail8 += '<div class="owl-carousel-1 slider-wapper owl-carousel owl-theme" style = "opacity: 1; width: 100%; display: inline-block;">';
		detail8 += '<div class = "owl-wapper-outer" style="width: 750px; margin:0 auto;"><div class = "owl-wapper">';
		detail8 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail8 += '<img src="../resources/image/img-22.JPG"></div></div></div></div>';
		detail8 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail8 += '<img src="../resources/image/img-23.JPG"></div></div></div></div>';
		detail8 += '<div class="owl-item" style="width: 250px;"><div><div class="thumbnail-box-wrapper mrg5A"><div class="thumbnail-box">';
		detail8 += '<img src="../resources/image/img-24.JPG"></div></div></div></div>';
		detail8 += '</div></div></div>';
		detail8 += '<h3 class="p-title"></h3></div></div>';
		detail8 += '</div>';

		$(function() {
			$('.opendetail').html(detail8);
		});
	}
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

	<!-- Owl carousel -->

	<!--<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/owlcarousel/owlcarousel.css">-->
	<script type="text/javascript"
		src="../resources/assets/widgets/owlcarousel/owlcarousel.js"></script>
	<script type="text/javascript"
		src="../resources/assets/widgets/owlcarousel/owlcarousel-demo.js"></script>


	<div class="container">
		<h3 class="p-title">
			<span>COMMON
				CAFE</span>
			<!-- 항목 이름 수정 -->
		</h3>
		<div
			class="owl-carousel-1 slider-wrapper inverse arrows-outside carousel-wrapper">

			<!-- 에스키모 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail1()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/eskimo.JPG"
							style="width: 74%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail1()"> <!-- href 수정 --> ESKIMO
								코엑스몰점
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- 카페루미 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail2()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/rumi.jpg"
							style="width: 61%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail2()"> <!-- href 수정 -->
								카페루미
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- 뉴코피커피 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail3()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/kopi.jpg"
							style="width: 61%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail3()"> <!-- href 수정 --> 
							뉴코피커피
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- 하바나 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail4()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/hanava.jpg"
							style="width: 61%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail4()"> <!-- href 수정 -->
								하바나
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- 카페메이트 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail5()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/cafemate.jpg"
							style="width: 61%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail5()"> <!-- href 수정 --> 
							카페메이트
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- 에이블 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail6()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/able.jpg"
							style="width: 61%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail6()"> <!-- href 수정 -->
							에이블
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- B ROAD 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail7()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/broad.jpg"
							style="width: 61%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail7()"> <!-- href 수정 -->
							B ROAD
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

			<!-- 자판기 부분 시작 -->
			<div>
				<div class="thumbnail-box-wrapper mrg5A">
					<div class="thumbnail-box">
						<a class="thumb-link" href="javascript:opendetail8()"></a>
						<!-- href 수정 -->
						<div class="thumb-content">
							<div class="center-vertical">
								<div class="center-content">
									<i class="icon-helper icon-center animated zoomInUp"></i>
								</div>
							</div>
						</div>
						<div class="thumb-overlay"></div>
						<img src="../resources/image/zapan.JPG"
							style="width: 60%; margin-left: auto; margin-right: auto; display: block;">
					</div>
					<div class="thumb-pane">
						<h3 class="thumb-heading animated rollIn">
							<a href="javascript:opendetail8()"> <!-- href 수정 -->
							 자판기
							</a>
							<!-- 위의 css 처리는 현 페이지에서 처리했음. -->
						</h3>
					</div>
				</div>
			</div>

		</div>
		<div style="height: 80px; width: 100%;"></div>
	</div>

	<!-- ┌카페 이미지 클릭시 상세 페이지가 뜰 부분┐-->
	<div class="opendetail"></div>
	<!-- └카페 이미지 클릭시 상세 페이지가 뜰 부분┘-->
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
	<script type="text/javascript"
		src="../resources/assets/tether/src/js/utils.js"></script>
	<script type="text/javascript"
		src="../resources/assets/tether/src/js/tether.js"></script>
	<script type="text/javascript"
		src="../resources/assets/bootstrap/js/bootstrap.js"></script>

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