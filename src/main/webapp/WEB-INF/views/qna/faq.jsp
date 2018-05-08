<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.item-list{display: none}
</style>
<title>FAQ</title>
</head>
<body>
			<h2>FAQ</h2>
			<div>
				많은 고객님께서 자주 문의하시는 질문에 대한 답변안내입니다. 
			</div>			

<!-- 			<form name="search" method="post" action="faq.asp">
			<input type="hidden" name="FT_Gubun" value="all">
			<div class="search-form">
				<span class="search-title">검색</span>
				<input type="text" name="search" placeholder="ex) 배송, 결제, 주문, 쿠폰" />
				<input type="submit" class="submit" value="검색" onclick="document.NextFrm.submit();"/>
			</div> -->
	
			<ul class="category">
				<li class="active" id="taball" name="tab"><a href = "">ALL</a></li><!-- 선택된 카테고리에 active class -->
				<li id="tabA" name="tab"><a href = "javascript:item();"><span>상품관련</a></span></li>
				<li id="tabB" name="tab"><a href = "">주문결제/배송</a></li>
				<li id="tabC" name="tab"><a href = "">교환/환불</a></li>
				<li id="tabD" name="tab" class="last"><a>회원정보</a></li>
			</ul>
			
			<div class="item-list">
					<div class="item">
						<div class="item-q kind" onclick="item-q()">
							<div>세탁세제에 알갱이 같은 것이 보이는데 어떤 성분때문에 그런 건가요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>코코넛에서 추출한 물질인 소듐코코설페이트 때문입니다. 낮은 온도에서 보관 시 알갱이처럼 굳거나 뭉칠 수 있으며, 사용상 지장 없습니다. 소듐코코설페이트는 강아지 털에 낀 기름기를 제거할 때 물에 잘 용해 될 수 있도록 해 주는 물질입니다.</p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>샴푸에 알갱이 같은 것이 보이는데 어떤 성분때문에 그런 건가요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>코코넛에서 추출한 물질인 소듐코코설페이트 때문입니다. 낮은 온도에서 보관 시 알갱이처럼 굳거나 뭉칠 수 있으며, 사용상 지장 없습니다. 소듐코코설페이트는 강아지 털에 낀 기름기를 제거할 때 물에 잘 용해 될 수 있도록 해 주는 물질입니다.</p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>다른 샴푸랑 비교했을 때 화이트코드 브라이트너만 파란색을 띄던데요. 무엇때문에 다른 건가요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>식용 색소 청색 1호(CI-42090) 성분이 Blue색을 띄는 성분이며, 모발 착색용 성분으로 첨가되어 있습니다. 립스틱, 립글로스 등에도 첨가되어 있는 무해한 성분입니다.</p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>강아지 눈물자국 닦는 용도로 물티슈 사용해도 될까요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>눈물이 착색되기 전에 닦아주어야 효과적 예방을 할 수 있습니다. <br>또한 퍼리프렌즈 물티슈는 눈물자국의 세균 번식 및 냄새 제거에 도움을 줍니다. <br></p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>탈취제를 인형같은 장난감에 뿌리면 소독효과가 있나요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>네, 냄새제거는 물론 유해세균 제거 효과가 있습니다.</p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>에티튜드 퍼리프렌즈 샴푸의 유통기한은 어떻게 되나요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>샴푸의 유통기한은 제조일로부터 2년 까지이며,<br>용기 하단에 기재되어 있습니다. <br>개봉 후에는 유통기한이 많이 남았더라도 1년 이내에 사용해주세요. </p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>에티튜드 퍼리프렌즈 클리너, 세제, 탈취제의 유통기한은 어떻게 되나요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>클리너, 세제, 탈취제의 유통기한은 제조일로부터 3년 까지이며,<br>용기 하단에 기재되어 있습니다. <br>개봉 후에는 유통기한이 많이 남았더라도 1년 이내에 사용해주세요. </p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>샴푸는 애완동물의 종이나 털색상에 따라 사용법이 다른가요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>아닙니다. 강아지의 종이나 털의 색상과 무관하게 사용 가능합니다.<br>만약 백모인 애완동물인 경우 천연 화이트 코트 브라이트너 샴푸를 추천합니다.</p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div class="item-q kind">
							<div>분양받은지 얼마되지 않은 새끼강아지 입니다. 현 샴푸가 피부자극이 덜한가요??</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>천연 성분을 만들어진 상품이기 때문에 전연령 사용 가능합니다.<br>허나, 2개월 미만의 강아지나 분양 받은 지 일주일이 안된 강아지는 스트레스나 감기에 건강이 악화될 수 있으므로 목욕을 피하는 것이 좋습니다.<br><br><br></p>
							</div>
						</div>
					</div>
				
					<div class="item">
						<div id="item-q kind">
							<div>피부병이 있는 애완동물인 경우 어떤 샴푸를 사용하는 것이 좋나요?</div>
						</div>
						<div class="item-a kind">
							<div>
								<p>민감한 피부의 반려동물을 위해 천연 오트밀 추출 성분으로 만들어진 수딩 오트밀 샴푸를 추천합니다. <br>다만 퍼리프렌즈 제품은 약용샴푸가 아니므로 외부기생충, 세균, 곰팡이 감염으로 인한 피부병이 있는 경우 반드시 수의사와 진료상담 후 전용 약용샴푸를 사용하시는 것이 좋습니다.<br></p>
							</div>
						</div>
					</div>
					
<script type="text/javascript">
		function item(){
			alert("나오라");
			$("#item-q kind").css("display","block");
		};
/* 			$(".item-list .item .item-q").click(function(){
				if( $(this).parent().hasClass('open') ) {
					$(this).parent().removeClass('open');
				} else {
					$(this).parents('.item-list').find(".open").removeClass('open');
					$(this).parent().addClass('open');
				}
			}); 

	});*/

</script>
</body>
</html>