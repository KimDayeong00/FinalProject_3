<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#comment {display: none;}
</style>
<title>1:1문의</title>
</head>
<body>
	<h2>1:1문의</h2>
		<form action = "" method = "post">
	<table border = "1" width = "800" id = "qnalist">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>문의날짜</th>
			<th>답변상태</th>
		</tr>
			<tbody id = "insertbody">
				<c:forEach var = "vo" items = "${adminlist }">
					<tr>
						<td>${vo.qnum }</td>
						<td>${vo.title }</td>
						<td>${vo.content }</td>
						<td>${vo.regdate }</td>
						<td><input type="button" class="insertbtn" value="답변하기"></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
		</form>
	<br>
<!-- 페이징 -->
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> <!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/qna/adminqna?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/qna/adminqna?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style='color:#555'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div style="">
	<div><a href="<c:url value='/qna/adminqna'/>">전체글</a></div>
	<div>
		<form action="<c:url value='/qna/adminqna'/>" method="post">
			<select name="field">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }"><input type="submit" value="검색">
		</form>
	</div>
</div>
	<br>
	<div id = "comment">
 		<form action="" method="post">
			제목<input type="text" id="title">
			내용<textarea rows="3" cols = "30" id="content"></textarea>
			<br><br>
			<input type="button" value="답변하기" id="admininsert">
			<input type="reset" value="취소">
		</form>
	</div>



<script type="text/javascript">
	var select=document.getElementsByName("field")[0];
	for(var i=0;i<select.options.length;i++){
		if(select.options[i].value=='${field}'){
			select.options[i].selected=true;
		}
	}
/* 	function admininsert(title){
		$("#comment").css("display","block");
		alert(title);
		$("#title").val("[re]" + title);
	} */
	$(".insertbtn").click(function(){ 
		alert("버튼");
/* 		alert(title);
		$("#comment").css("display","block");
		$("#title").val("[re]" + title); */
		/* var str = ""
		var tdArr = new Array();	// 배열 선언
		var insertbtn = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = insertbtn.parent().parent();
		var td = tr.children();
		
		alert("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var no = td.eq(0).text();
		var userid = td.eq(1).text();
		var name = td.eq(2).text();
		var email = td.eq(3).text(); */
	});
	
	
	
	
	
	
	
	
	
	
</script>

</body>
</html>