<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>중분류(Field)</h2>
		<table border = "1" width = "500" id = "fieldList">
			<tr>
				<th>Field_Num</th>
				<th>Class_Num</th>
				<th>NAME</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<tbody id="fieldListBody">
			
			</tbody>
		</table>
		<br>
		<form action = "" method = "post">
			중분류 이름<input type = "text" id = "name">
			<input type = "button" id = "fieldInsert" value = "추가">
		</form>
</body>
</html>