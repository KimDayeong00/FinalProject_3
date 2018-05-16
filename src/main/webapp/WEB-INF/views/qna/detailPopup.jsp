<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="detail">
	<table>
		<tr>
			<td>
				<label id="labelregdate">문의날짜</label>
			</td>
			<td>
				<fmt:formatDate value="${detailqna.regdate }" type="DATE" pattern="yyyy/MM/dd"/>
			</td>
		</tr>
		<tr>
			<td>
				<label id="labeltitle">문의제목</label>
			</td>
			<td>
				<input type="text" name="title" id="title" style="width: 300px" value=${detailqna.title } readonly="readonly">
			</td>
		</tr>

		<tr>
			<td>
				<label id="labelcontent">문의내용</label>
			</td>
			<td>
				<textarea rows="20" cols="45" name="content" id="content" readonly="readonly">${detailqna.content }</textarea>
			</td>
		</tr>
	</table>		
</div>

<script type="text/javascript">
	function outPopup(){
		window.close();
	 }
</script>