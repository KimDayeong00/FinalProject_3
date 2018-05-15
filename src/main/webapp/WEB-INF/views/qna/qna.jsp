<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#insert {display: none; text-align: center;}
	#detail {display: none;}
	#showform {border-radius: 0.5em; color: black; background-color: white;}
	#reset {border-radius: 0.5em; color: black; background-color: white;}
	#qnainsert {border-radius: 0.5em; color: black; background-color: #E4E4E4; margin-bottom: 30px;}
	#search {border-radius: 0.5em; color: black; background-color: white;}
	#keyword {border-radius: 0.5em;}
	#title {border-bottom-right-radius: 15px; width: 360px;}
	#content {border-bottom-right-radius: 30px; width: 360px;}
	
</style>
<br><br><br>
<title>1:1문의</title>
</head>
<body>
	<div id = "main" style = "text-align: center;">
	<h2 id = "h2" style = "margin-bottom: 30px">1:1문의내역</h2>
	<div style = "text-align:center;">
	<table style = "margin: auto;" border = "1" width = "1000" id = "qnalist">
		<tr>
			<th style="text-align: center; width: 150px;">문의날짜</th>
			<th style="text-align: center; width: 400px;">문의제목</th>
			<th style="text-align: center; width: 150px;">상세보기</th>
			<th style="text-align: center; width: 150px;">답변상태</th>
		</tr>
		<tbody id = "insertbody">
			<c:forEach var = "vo" items = "${qnalist }">
				<tr>
					<td><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy/MM/dd" />
					<fmt:formatDate pattern = "yyyy-MM-dd" 
         value = "${vo.regdate}" />
					</td>
					<td style = "text-align: left;padding-left: 10px">${vo.title }</td>
					<td><a href="javascript:detail('${vo.regdate }','${vo.title}','${vo.content }')">상세보기</a></td>
					<td>처리중</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

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
			<select name="field" id = "field">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }" id = "keyword"><input type="submit" value="검색" id = "search">
		</form>
	</div>
</div>



	<br>
	<input type = "button" value = "1:1문의하기" id = "showform">
	</div>
	<br><br><br>
	<div id = "insert" >
 		<form action="<c:url value='/qna/insert'/>" method="post">
			 <label id="option" style = "">관련상품</label>
			<select size="1" name="p_num">
				<option value="">선택하세요</option>
				<c:forEach var="vo" items="${orderiteminfo }">
					<option value="${vo.p_num }">${vo.item_name }</option>
				</c:forEach>
			</select>
			<br>
			<input type = "hidden" name = "qnum" value = "0">
			 <label id="qnalabeltitle">문의제목</label>
			<input type="text" name="title" id = "title">
			<br>
			 <label id="qnalabelcontent">문의내용</label>
			<textarea rows="3" cols = "30" name="content" id = "content"></textarea>
			<br>
			<input type="reset" value="취소" id = "reset">
			<input type="submit" value="문의하기" name="qnainsert" id = "qnainsert">
			<br>
		</form>
	</div>
	<div id = detail>
	<label id="detaillabelregdate">문의날짜</label><br>
			<input type="text" id = "detailregdate" name="detailregdate" style = "size: 100;">
			<br>
	 <label id="detaillabelcontent">문의제목</label><br>
			<input type="text" id = "detailtitle" name="detailtitle" style = "size: 100;">
			<br>
			 <label id="detaillabeltitle">문의내용</label><br>
			<textarea rows="3" cols = "30" id = "detailcontent" name="detailcontent" style = "size: 50;"></textarea>
			<br><br>
			<input type="submit" value="확인" name="qnainsert">
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
		$("input[type='hidden']");
	});
	function detail(regdate, title, content){
		$("#detail").css("display","block");
		$("#detailregdate").val(regdate);
		$("#detailtitle").val(title);
		$("#detailcontent").val(content);
	}
	$("#reset").click(function(){
		$("#insert").css("display","none");
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