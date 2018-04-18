<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Want to start your travel agency online and need website for your travel business? Start with travel agency responsive website template. Its absolutely free.">
    <meta name="keywords" content="travel, tour, tourism, honeymoon pacakage, summer trip, exotic vacation, destination, international, domestic website template, holiday, travel agecny responsive website template">
    <title>Tour and Travel Agency - Responsive Website Template</title>
    <!-- Bootstrap -->
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Style CSS -->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"> </script>
</head>

<body>
    <!-- header-section start -->
    <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-md-4 hidden-sm col-sm-12">
                    <div class="call-info">
                        <p class="call-text">Any Question? Call Us:<strong>252-386-7004</strong></p>
                    </div>
                </div>
                <div class="col-md-8 hidden-sm hidden-xs">
                    <div class="social">
                        <ul>
                        	<li><a href="<c:url value="/login" />">로그인</a></li>
                        	<li><a href="#">회원가입</a></li>
                        	<li><a href="#">펫시터 등록</a></li>
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
    </div>
    <div class="header-wrapper">
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-2 col-sm-12 col-xs-12">
                    <c:url value=''/>
                        <a href="<c:url value='/'/>"><img src="<c:url value='/resources/images/logo.png'/>" alt="Tour and Travel Agency - Responsive Website Template"></a>
                    </div>
                    <div class="col-lg-8 col-md-10 col-sm-12 col-xs-12">
                        <div class="navigation">
                            <div id="navigation">
                                <ul>
                                    <!-- <li class="active"><a href="index.html" title="Home">홈</a></li> -->
                                    <li><a href="about.html" title="About us">소개</a> </li>
                                    <!-- <li class="has-sub"><a href="blog-default.html" title="Blog ">Blog</a>
                                        <ul>
                                            <li><a href="blog-default.html" title="Blog">Blog Default</a></li>
                                            <li><a href="blog-single.html" title="Blog Single ">Blog Single</a></li>
                                        </ul>
                                    </li> -->
                                    <li><a href="contact-us.html" title="Contact Us">예약하기</a> </li>
                                    <li><a href=" <c:url value='/shop/home'/>" title="ShoppingMall">쇼핑몰</a>
                                    <li><a href="styleguide.html" title="Styleguide">이용방법</a> </li>
                                    <li class="has-sub"><a href="#" title="Tours">고객지원</a>
                                        <ul>
                                            <li><a href="domestic-tour.html" title="Group Tours">Domestic Tours</a></li>
                                            <li><a href="international-tour.html" title="Couple Tours">International Tours</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>