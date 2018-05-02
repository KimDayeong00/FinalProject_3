<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<style>
	#qnaform {display: none;}
</style>

<script type="text/javascript">
	
		<%
		String email = (String)session.getAttribute("login");
		%>
	function showform(){
		$("#qnaform").css("display","block");
	}
</script>
<title>1:1문의</title>
</head>
<body>
	<h2>1:1문의</h2>
	<table border = "1" width = "500" id = "qnalist">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>문의날짜</th>
			<th>답변상태</th>
		</tr>
		<c:forEach var = "vo" items = "${qnalist }">
			<tr>
				<td>${vo.qnum }</td>
				<td>${vo.title }</td>
				<td>${vo.content }</td>
				<td>${vo.regdate }</td>
				<td>답변상태</td>
			</tr>
		</c:forEach>
	</table>
	<br>


<!-- 페이징 -->
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> <!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/qna/qna?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/qna/qna?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style='color:#555'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div style="">
	<div><a href="<c:url value='/qna/qna'/>">전체글</a></div>
	<div>
		<form action="<c:url value='/qna/qna'/>" method="post">
			<select name="field">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }"><input type="submit" value="검색">
		</form>
	</div>
</div>


	<br>
	<input type = "button" value = "1:1문의하기" onclick = "showform()">
	<div id = "qnaform">
		<form action = "/qna/qnainsert">
			<div id = "type">
				문의유형<input type = "radio" name = "qnatype" checked = "checked">배송관련
				<input type = "radio" name = "qnatype">상품관련
				<input type = "radio" name = "qnatype">취소/교환/반품
			</div>
			<div>
				관련상품<select id = "item" size = "1">
					<option value = "">선택하세요</option>
					
				</select>
			</div>
			<div id = "title">
				제목<input type = "text" id = "qnatitle">
			</div>
			<div id = "content">
				내용<textarea rows = "3" cols = "30" id = "qnacontent"></textarea>
			</div>
			<br><br>
			<input type = "submit" value = "문의하기">
			<input type = "reset" value = "취소">
		</form>
	</div>



<script type="text/javascript">
	var select=document.getElementsByName("field")[0];
	for(var i=0;i<select.options.length;i++){
		if(select.options[i].value=='${field}'){
			select.options[i].selected=true;
		}
	}
</script>
