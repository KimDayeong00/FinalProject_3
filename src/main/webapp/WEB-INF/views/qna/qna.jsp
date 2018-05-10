<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#insert {display: none;}
	#h2 {text-align: center;}
	#qnalist {text-align: center;}
</style>
<title>1:1문의</title>
</head>
<body>
	<h2 id = "h2">1:1문의내역</h2>
	<table style = "text-align:center;" border = "1" width = "500" id = "qnalist">
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>문의날짜</th>
			<th>답변상태</th>
		</tr>
		<tbody id = "insertbody">
			<c:forEach var = "vo" items = "${qnalist }">
				<tr>
					<td>${vo.title }</td>
					<td>${vo.content }</td>
					<td>${vo.regdate }</td>
					<td>답변상태</td>
				</tr>
			</c:forEach>
		</tbody>
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
	<input type = "button" value = "1:1문의하기" id = "showform">
	
	<div id = "insert">
 		<form action="<c:url value='/qna/insert'/>" method="post">
			관련상품<select size="1" name="p_num">
				<option value="">선택하세요</option>
				<c:forEach var="vo" items="${orderiteminfo }">
					<option value="${vo.p_num }">${vo.item_name }</option>
				</c:forEach>
			</select>
			<input type = "hidden" name = "qnum" value = "0">
			제목<input type="text" name="title">
			내용<textarea rows="3" cols = "30" name="content"></textarea>
			<br><br>
			<input type="submit" value="문의하기" name="qnainsert">
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
/* 	var select=document.getElementsByName("orderiteminfo")[0];
	for(var i=0;i<select.options.length;i++){
		if(select.options[i].value=='${item_name}'){
			select.options[i].selected=true;
		}
	} */
	
	$("#showform").click(function(){
		$("#insert").css("display","block");
	});
	$("#qnainsert").click(function(){
		$("#insert").css("display","none");
		
/*  		$.ajax({
			url : "<c:url value = '/qna/insert'/>",
			data : {p_num : p_num, title : title, content : content},
			dataType : "json",
			success : function(data){
				console.log(data);
				$("#insertbody").html("");
				for(var i=0;i<data.length;i++){
				var str = "<tr>";
				var title = data[i].title;
				var content = data[i].content;
				var regdate = data[i].regdate;
					str += "<td>" + title + "</td><td>" + content + "</td><td>" + regdate + "</td><td>답변상태</td>" ;
					str += "</tr>";
					$("#insertbody").append(str);
				}
			}
 		}); */
	});
	
	
	
	
	
	
	
	
	
	
	
</script>

</body>
</html>