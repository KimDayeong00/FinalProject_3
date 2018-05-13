<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<!-- 
로그인체크하기 로그인 session에 값이 존재 할 경우 헤더의 로그인 회원가입 펫시터등록 부분을 로그아웃으로 바꿔준더
 -->
<%
String email = (String)session.getAttribute("login");
%>

<body>



    <div class="top-bar">
            <div class="row" >
                <div class="col-md-11 hidden-sm hidden-xs">
                    <div class="social">
                        <ul>
                        <%
                        if(email != null ){
                        %>
                        <li><a href="<c:url value='/mypage'/>" style="font-size: 15px;">마이페이지</a>
                        <li><a href="<c:url value="/logout" />" style="font-size: 15px;">로그아웃</a></li>
                        <%
                        }else if (email == null || email.equals("")){
                        %>
                        	<li><a href="<c:url value="/login" />" style="font-size: 15px;">로그인</a></li>
                        	<li><a href="<c:url value="/register1" />" style="font-size: 15px;">회원가입</a></li>
                        	<li><a href="<c:url value="/register2" />" style="font-size: 15px;">펫시터 등록</a></li>
                        
                        <%
                        }%>
                        	<!-- 
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                             -->
                        </ul>
                    </div>
                </div>
            </div>
    </div>
    <div class="header-wrapper">
        <div class="header" >
                    <div class="col-lg-5 col-md-2 col-sm-12 col-xs-12">
                        <a href="<c:url value='/'/>" style="margin-left: 100px;"><img style="height: 50px;" src="<c:url value='/resources/images/logo.JPG'/>" alt="Tour and Travel Agency - Responsive Website Template"></a>
                    </div>
                <div class="row" >
                    <div class="col-lg-6 col-md-10 col-sm-12 col-xs-12">
                        <div class="navigation">
                            <div id="navigation">
                                <ul>
                                    <!-- <li class="active"><a href="index.html" title="Home">홈</a></li> -->
                                    <li><a href="<c:url value='/introduce/getinfo'/>" title="About us">이용방법</a> </li>
                                    <!-- <li class="has-sub"><a href="blog-default.html" title="Blog ">Blog</a>
                                        <ul>
                                            <li><a href="blog-default.html" title="Blog">Blog Default</a></li>
                                            <li><a href="blog-single.html" title="Blog Single ">Blog Single</a></li>
                                        </ul>
                                    </li> -->
									 <li><a href="<c:url value='/booking/list'/>" title="BookingList">예약하기</a> </li>
                                             <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">카테고리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
           <li><a href=" <c:url value='/shop/home'/>" title="ShoppingMall">쇼핑몰 홈</a></li>
            <c:forEach var="classvo" items="${classvo}">
          <li><a href="<c:url value='/item/classitemlist?classnum=${classvo.classnum }'/>">${classvo.name }</a></li>
        </c:forEach>    
          </ul>
        </li>       
                                    <li class="has-sub"><a href="#" title="Tours">고객지원</a>
                                        <ul>
                                            <li><a href="<c:url value='/qna/faq'/>" title="Group Tours">FAQ</a></li>
                                            <li><a href="<c:url value='/qna/qna'/>" title="Couple Tours">1:1문의</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>