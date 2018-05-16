<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- page content -->
<div class="right_col" role="main">
	<h1>메인입니다</h1>
	<c:forEach var="qna" items="${adminlist }">
		${qna.m_email }
	</c:forEach>
</div>
<!-- page content -->
