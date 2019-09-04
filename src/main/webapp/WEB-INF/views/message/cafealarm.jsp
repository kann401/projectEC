<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECO COFFEE - MESSAGE</title>

<script type="text/javascript" src="./resources/js/jquery-3.1.1.min.js"></script>

<script>
	popupOnce();

	function popupOnce() {
		var tmp = false;
		var url = 'alarm';
		//팝업창 옵션(optoin)
		var option = "width=250, height=250, resizable=no, scrollbars=no, status=no, location=no";
		var left = Math.ceil(window.screen.width - 250);
		var top = Math.ceil(window.screen.height - 360);

		//최초 클릭이면 팝업을 띄운다.
		if (tmp == false) {

			$(function() {
				timer = setInterval(function() {
					$.ajax({
						url : "cafeMemocheck", // ----- (1)
						type : 'GET',
						contentType : "application/json; charset=utf-8",
						cache : false,
						success : function(memolist) { // ----- (2)
							if (memolist.length != 0) {
								Clip = window.open(url, '메시지 도착', option
										+ ", left=" + left + ", top=" + top);
							}
						}
					});
				}, 6000);
			});

			tmp = true;
			//최초 클릭이 아니면
		} else {
			//팝업창 존재 여부를 확인하여 팝업창이 이미 떠 있으면 포커스
			if (!Clip.closed && Clip) {
				Clip.focus();

				//없으면 팝업을 다시 띄울 수 있게 한다.
			} else {
				Clip = window.open(url, '', option);
				tmp = true;
			}
		}
	}
</script>


</head>
<body>

</body>
</html>