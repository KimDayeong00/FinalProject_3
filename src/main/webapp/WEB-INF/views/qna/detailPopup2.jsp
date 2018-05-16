<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="detail">
	<table>
		<tr>
			<td>
				<label id="labelcontent">문의질문</label>
			</td>
			
			<td>
				<div style="margin-left: 20px;">${detailqna.aqtitle }</div>		
			</td>
		</tr>
		
		<tr>
			<td>
				<label id="labelcontent">문의답변</label>
			</td>
			<td>
			<div style="margin-left: 20px;">${detailqna.aqcontent }</div>
			</td>
		</tr>
	</table>		
</div>

<script type="text/javascript">
	function outPopup(){
		window.close();
	 }
</script>