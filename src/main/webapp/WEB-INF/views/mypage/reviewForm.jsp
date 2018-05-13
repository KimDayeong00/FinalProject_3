<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function sendIt(){
		window.close();
	}
</script>
<body>
	<div>
		<p><strong>리뷰 작성하기</strong></p>
		<form action="<c:url value='/reviewInsert'/>" method="post" onsubmit="return sendIt();">
		<table>
			<tr>
				<th>평점</th>
				<td>
					<input type="checkbox" name="r_score" value="0">☆
					<input type="checkbox" name="r_score" value="1">★
					<input type="checkbox" name="r_score" value="2">★★
					<input type="checkbox" name="r_score" value="3">★★★
					<input type="checkbox" name="r_score" value="4">★★★★
					<input type="checkbox" name="r_score" value="5">★★★★★
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="12" cols="50" name="r_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="등록하기">
		</form>
	</div>
</body>
</html>