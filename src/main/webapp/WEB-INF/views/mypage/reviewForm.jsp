<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"> </script>
</head>
<script type="text/javascript">
	function sendIt(){
	//	window.opener.aaaaa();
		$("#frm").submit();
	}
	if(${popup=='1'}){
		opener.location.href="<c:url value='/mypagePrevlist?dtld=prevReservation'/>";
		window.close();
	}
	
</script>
<body>
	<div>
		<p><strong>리뷰 작성하기</strong></p>
		<form action="<c:url value='/reviewInsert'/>" method="post"  id="frm">
		<table>
			<tr>
				<th>평점</th>
				<td>
					<input type="radio" name="r_score" value="0">☆
					<input type="radio" name="r_score" value="1">★
					<input type="radio" name="r_score" value="2">★★
					<input type="radio" name="r_score" value="3">★★★
					<input type="radio" name="r_score" value="4">★★★★
					<input type="radio" name="r_score" value="5">★★★★★
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="12" cols="50" name="r_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="bk_num" value="${bk_num }">
		<input type="hidden" name="ps_email" value="${ps_email }">
		<input type="button" value="등록하기" onclick="sendIt()">
		</form>
	</div>
</body>
</html>