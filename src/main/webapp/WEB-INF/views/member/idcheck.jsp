<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="global.sesoc.projectEC.vo.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ECO COFFEE - ID CHECK</title>

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

<!-- JavaScript -->
<script src="../resources/js/alertify.js"></script>

<!-- alert CSS --> 
<!-- include the style --> 
<link rel="stylesheet" href="../resources/css/alertify.min.css" />
<!-- <!-- include a theme -->
<link rel="stylesheet" href="../resources/css/themes/default.min.css" />

<script type="text/javascript">
	//ID 중복 검색폼 확인
	function formCheck() {
		if (document.getElementById('searchId').value.length < 3) {
			alertify.alert('Please enter at least 3 characters to search for ID.');
			return false;
		}
		return true;
	}

	//검색한 ID를 가입폼에 입력하고 현재 창 닫기
	function idSelect(id) {
		opener.document.getElementById('custid').value = id;
		this.close();
	}
</script>

</head>
<body>

	<div class="panel-body">
		<h3 class="title-hero">ID CHECK</h3>
		<div class="example-box-wrapper">
			<div class="form-group">
				<div class="col-sm-6" align="center">
					<form action="idcheck" id="idcheck"
						class="form-horizontal bordered-row" method="post"
						onsubmit="return formCheck();">
						<input type="text" name="searchId" id="searchId"
							class="form-control" value="${searchId}"
							placeholder="Enter ID to Search"> <br>
						<button
							class="btn btn-border btn-alt border-green btn-link font-green"
							type="submit">Search</button>
					</form>
				</div>
				<br>

				<div align="center">
					<!-- 검색 후에만 출력 -->
					<label class="col-sm-3 control-label"> <c:if
							test="${search}">

							<!-- 검색된 결과가 없는 경우 -->
							<c:if test="${searchResult == null}">
								<p>${searchId}
									: 사용할 수 있는 ID입니다.&nbsp;
									<button class="btn btn-default" type="submit"
										onclick="idSelect('${searchId}')">
										<i class="glyph-icon icon-download"></i>
									</button>
							</c:if>

							<!-- 검색된 결과가 있는 경우 -->
							<c:if test="${searchResult != null}">
								<p>${searchId}: 이미 사용중인 ID입니다.</p>
							</c:if>
						</c:if>
					</label>
				</div>
			</div>
		</div>
	</div>
</body>
</html>