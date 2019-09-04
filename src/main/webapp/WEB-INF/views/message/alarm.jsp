<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery 부분 -->
<script type="text/javascript" src="./resources/js/jquery-3.1.1.min.js"></script>

<script>
	//세션에 id가 존재한다면 (if문) 쪽지 알림 실행하기
	var audio = new Audio('./resources/video/msg.mp3');
	audio.play();
	/* $(function() {
		
			
			$.ajax ({
				url : "memocheck",  // ----- (1)
				type: 'GET',
				contentType : "application/json; charset=utf-8",
				cache : false,
				success : function (memolist) { // ----- (2)
					if(memolist.size != 0){
						location.reload();
					}
				}
			});
			
		
	}); */

	function mailbox() {
		var parentWindow = window.opener;
		parentWindow.location.href = 'notreadmsg'
		closepopup();
	}

	function closepopup() {
		close(); //창만 닫히게 하면 된다.
	}
</script>
</head>
<body>
	<a href="javascript:mailbox()"><img src="./resources/image/75.jpg"
		style="width: 100%"></a>
	<br>

</body>
</html>