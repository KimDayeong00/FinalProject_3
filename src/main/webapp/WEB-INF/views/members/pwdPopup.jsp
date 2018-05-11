<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
 
 
<!-- Bootstrap -->
<link href='<c:url value="/resources/css/bootstrap.min.css" />' rel="stylesheet">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src='<c:url value="/resources/js/jquery-3.3.1.min.js" />'></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src='<c:url value="/resources/js/bootstrap.min.js"  />'></script>
 

<div class="container">
  <h2>등록된 회원정보로 찾기</h2>
</h4>회원정보에 등록한 아이디, 이름, 이메일 주소로
비밀번호를 재설정합니다.</h4>
  <form action="<c:url value="/searchPwd" />" method="post">
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="이메일을 입력해 주세요" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="이름을 입력해 주세요" class="form-control"></textarea>
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</div>
