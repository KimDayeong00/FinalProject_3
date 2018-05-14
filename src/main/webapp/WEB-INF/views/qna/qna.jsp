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
			<th style="text-align: center; width: 100px;">삭제</th>
		</tr>
		<tbody id = "insertbody">
			<c:forEach var = "vo" items = "${qnalist }">
				<tr>
					<td><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy/MM/dd" /></td>
					<td style = "text-align: left;padding-left: 10px">${vo.title }</td>
					<td><a href="javascript:detail('${vo.qnum }')">상세보기</a></td>
					<c:choose>
						<c:when test = "${0==vo.hit }">
							<td>${vo.comments }</td>
						</c:when>
						<c:otherwise>
							<td><a href="javascript:comm('${vo.qnum }')">답변완료</a></td>
						</c:otherwise>
					</c:choose>
					<td><a href = "<c:url value='/qna/delete?qnum=${vo.qnum }'/>">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

	<input type = "button" value = "1:1문의하기" id = "showform" onclick="getPopup()" style = "margin-left: 880px; margin-top: 20px;">
<!-- 페이징 -->
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"> <!-- 현재페이지 색상 다르게 표시하기 -->
				<a href="<c:url value='/qna/qna?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style='color:blue'></span></a>
	
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/qna/qna?pageNum=${i }&field=${field }&keyword=${keyword }'/>"><span style='color:#555'></span></a>
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
	</div>
	<br><br><br>
	

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
	
/* 	$("#showform").click(function(){
		$("#insert").css("display","block");
		$("input[type='hidden']");
	}); */
	var pop;
	function getPopup(){
	 pop = window.open("<c:url value='/qna/qnaPopup?' />","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function testCheck(){
		console.log("옴");
		setTimeout(() => {
			location.href="<c:url value='/qna/qna'/>";
		}, 100);	
	}
	function detail(qnum){
		$("#detail").css("display","block");
/* 		$("#detailregdate").val(regdate);
		$("#detailtitle").val(title);
		$("#detailcontent").val(content); */
		var url = "/qna/detailPopup?qnum="+qnum;

		pop = window.open("<c:url value='/qna/detailPopup?qnum="+qnum+"' />", "pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	$("#reset").click(function(){
		$("#insert").css("display","none");
	});
	$("#comm").click(function(){
		$("#commform").css("display","block");
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