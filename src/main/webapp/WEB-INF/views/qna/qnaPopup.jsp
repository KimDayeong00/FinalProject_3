<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>

<style type="text/css">
	#reset {border-radius: 0.5em; color: black; background-color: white; margin-left: 165px;}
	#qnainsert {border-radius: 0.5em; color: black; background-color: #E4E4E4; margin-bottom: 30px;}
</style>

 <div id = "insert">
 		<form action="<c:url value='/qna/insert'/>" method="post" onsubmit="return aaa()">
 		<table><tr><td>
			 <label id="option" style = "">관련상품</label></td>
			<td><select size="1" name="p_num" style = "width:300px">
				<option value="">선택하세요</option>
				<c:forEach var="vo" items="${orderiteminfo }">
					<option value="${vo.p_num }">${vo.item_name }</option>
				</c:forEach>
			</select></td>
			</tr>
			<tr><td>
			
			 <label id="qnalabeltitle">문의제목</label></td>
			 <td>
			<input type="text" name="title" id = "title" style = "width:300px">
			</td>
			<tr>
			<tr><td>
			 <label id="qnalabelcontent">문의내용</label></td><td>
			<textarea rows="20" cols = "45" name="content" id = "content"></textarea>
			</td></tr>
			
			<br>
			</table>
			<input type="reset" value="취소" id = "reset" onclick="outPopup()">
			<input type="submit" value="문의하기" name="qnainsert" id = "qnainsert" onclick="">
		</form>
	</div>
	
<script type="text/javascript">
function aaa(){
	    window.opener.testCheck(); 
	return true;
}
function outPopup(){
	window.close();
}
</script>
