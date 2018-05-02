<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
		
	});

</script>
<title>FAQ</title>
</head>
<body>
			<h2>FAQ</h2>
			<div>
				많은 고객님께서 자주 문의하시는 질문에 대한 답변안내입니다. 
			</div>			

			<form name="search" method="post" action="faq.asp">
			<input type="hidden" name="FT_Gubun" value="all">
			<div class="search-form">
				<span class="search-title">검색</span>
				<input type="text" name="search" placeholder="ex) 배송, 결제, 주문, 쿠폰" />
				<input type="submit" class="submit" value="검색" onclick="document.NextFrm.submit();"/>
			</div>
	
			<ul class="category">
				<li class="active" id="taball" name="tab"><a href = "">ALL</a></li><!-- 선택된 카테고리에 active class -->
				<li id="tabA" name="tab"><span><a href = "">상품관련</a></span></li>
				<li id="tabB" name="tab"><a href = "">주문결제/배송</a></li>
				<li id="tabC" name="tab"><a href = "">교환/환불</a></li>
				<li id="tabD" name="tab" class="last"><a href = "">회원정보</a></li>
			</form>	
			</ul>
			
			<div class="item-list">
				
					<div class="item">
						<div class="item-q">
							<div></div>
						</div>
						<div class="item-a">
							<div>
								<p></p>
							</div>
						</div>
					</div>
	
</body>
</html>