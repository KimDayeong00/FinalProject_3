<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

* 이메일 보내기 *
<form action="<c:url value="/send" />" method="post">
이메일 : <input type="email" name="receiver" placeholder="abc@abc.com"><br>
글제목 : <input type="text" name="subject"><br>
글 내용 : <textarea rows="5" cols="30" name="content"></textarea>
<p>
<input type="submit" value="메일 보내기">
</form>