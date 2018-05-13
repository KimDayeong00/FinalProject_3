<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

<div style="margin: 0 auto; position: relative; width: 994px; height: 64px; overflow: hidden;">

</div>

<div class="body_wrap" style="position: relative;">

<div class="content_wrap">
	


<!-- 주문상품 확인 -->
<form method="post" name="myform" action="https://queenpuppy.co.kr/shop/order2.php" onsubmit="return CheckForm(this);">
<input type="hidden" name="memberAddressZipcode1" value="">
<input type="hidden" name="memberAddressZipcode2" value="">
<input type="hidden" name="memberAddressAddr1" value="">
<input type="hidden" name="memberAddressAddr2" value="">

<div class="section">

	<!-- 장바구니 항목 -->
	<div class="cart_list_wrap">
		<table>
			<colgroup>
				<col width="110">
				<col width="364">
				<col width="145">
				<col width="100">
				<col width="150">
				<col width="125">
			</colgroup>
		
		
			<thead>
				<tr>
					<td colspan="2">상품정보</td>
					<td>판매가격</td>
					<td>수량</td>
					<td>주문금액</td>
				</tr>
			</thead>
			
			<tbody>
												<tr>
									<td><a href="product.html?pd_code=C010397"><img src="http://queenpuppy.co.kr/shop/pd_img/C01/397/C010397_2.jpg" width="90" height="90"></a></td>
									<td class="name">
										<div class="tag_wrap">
																																											</div>
										<a href="product.html?pd_code=C010397">펫메이트 디깅다이너 급식기</a>
										<ul>
																																</ul>
									</td>
									<td>
										<div class="price_nomal">33,000원</div>										<div class="price_sale">25,740원</div>
									</td>
									<td>1개</td>
									<td class="price">25,740원</td>
									<td>257p</td>
								</tr>
																<tr>
									<td><a href="product.html?pd_code=G010620"><img src="http://queenpuppy.co.kr/shop/pd_img/G01/620/G010620_2.jpg" width="90" height="90"></a></td>
									<td class="name">
										<div class="tag_wrap">
																																											</div>
										<a href="product.html?pd_code=G010620">에바 올인원 샴푸 510ml (無실리콘 천연 자연추출물 함유)</a>
										<ul>
																																</ul>
									</td>
									<td>
										<div class="price_nomal">12,000원</div>										<div class="price_sale">7,200원</div>
									</td>
									<td>1개</td>
									<td class="price">7,200원</td>
									<td>72p</td>
								</tr>
											</tbody>
		</table>
	</div>

	<div class="cart_line_wrap">
		<div class="point">예상적립포인트 : 329p</div>
	</div>

	<!--결제금액계산-->
	
	<!-- 장바구니 합계 -->
	<div class="cart_total_wrap">
		<div class="tit"><img src="images/cart_total_tit.png"></div>
		<div class="content">

			<div class="price"><!-- 상품금액 -->
				<img src="images/cart_total_01.png">
				<br>32,940원
			</div>

			
			<div class="sign"><!-- 배송비 -->
				<img src="images/cart_total_plus.png">
			</div>
			<div class="price">
				<img src="images/cart_total_02.png">
				<br>0원
			</div>

			
			
			<div class="sign">
				<img src="images/cart_total_equal.png">
			</div>
			<div class="price total"><!-- 결제예상금액 -->
				<img src="images/cart_total_06.png">
				<br>32,940원
			</div>

		</div>
	</div>

</div>


<!-- 구매사은품 -->
<input type="hidden" name="orderGift" value=""><!--구매사은품 아이디-->
<input type="hidden" name="orderGiftCost" value=""><!--구매사은품 비용-->
<input type="hidden" name="orderGiftSelectValue" value=""><!--구매사은품 선택옵션-->
<input type="hidden" name="orderGiftProduct" value=""><!--구매사은품 문자열-->
<input type="hidden" name="orderGiftTypePrice" value=""><!--구매사은품 금액-->

<div class="cart_gift_wrap">
	<div class="tit"><img src="images/cart_gift_tit.png"></div>
	<div class="info">
		<div class="left">
			<span class="bold">2만원이상 구매 사은품</span>에 해당됩니다. 구매사은품을 선택해주세요.<br>
			<div class="small">주문 금액 32,940원 중 32,940원이 구매사은품 기준 금액에 해당됩니다. (장바구니 상품정보에서 <div class="product_tag red" style="line-height:13px; font-size:1em;">구매사은품기준 제외</div> 표시된 제품을 참고해주세요.)</div>
		</div>
		<div class="right">
			<a href="/shop/shop_gift.html" target="_blank"><img src="images/cart_gift_more.png"></a>
		</div>
	</div>
	<div class="content">
		<input type="hidden" name="hasGift0Select" value="N">
				<div class="gift">
					<div class="line1">
						<label><input type="radio" name="Gift" value="2396"> 선택1</label>
						<input type="hidden" name="Gift0Cost" value="429">
						<input type="hidden" name="Gift0Product" value="더그린 스틱 3p 2종 중 1개">
						<input type="hidden" name="Gift0TypePrice" value="2-1">
					</div>
					<div class="line2"><img src="http://www.queenpuppy.co.kr/images/gift_images/gift_images_2_1.jpg"></div>
					<div class="line3">
						<ul>
				<li style="margin-top:5px;">더그린 스틱 3p 2종 중 1개</li>
						</ul>
						
					</div>
				</div>
				<input type="hidden" name="hasGift1Select" value="N">
				<div class="gift last">
					<div class="line1">
						<label><input type="radio" name="Gift" value="2397"> 선택2</label>
						<input type="hidden" name="Gift1Cost" value="0">
						<input type="hidden" name="Gift1Product" value="구매적립금 : 700원">
						<input type="hidden" name="Gift1TypePrice" value="2-2">
					</div>
					<div class="line2"><img src="http://www.queenpuppy.co.kr/images/buy_point_700.gif" class="ooo"></div>
					<div class="line3">
						구매적립금 700원<br>
						<span class="sub">출고완료시 예치금으로 적립되고, 로그인을 하지 않은 상태에서 주문하시면 적립되지 않습니다.</span>
					</div>
				</div>
					</div>
</div>

<!-- 구매사은품 -->




<!-- 배송지정보 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<script type="text/javascript">

function set_postcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			if(data.postcode1 == "") {
				data.postcode1 = data.zonecode.substr(0, 3);
				data.postcode2 = data.zonecode.substr(3, 2);
			}
			var fullAddr = data.address;
			document.getElementById("post1").value = data.postcode1;
			document.getElementById("post2").value = data.postcode2;
			document.getElementById("address1").value = fullAddr;
			document.getElementById("address2").focus();
		}
	}).open();
}

function set_postcode_old() {
	window.open("/mypage/addressFind.html", "addFind", "left=50,top=50,width=437,scrollbars=yes,height=352,status=no");
}

function ChangeAddress1() {
	frm = document.myform;
	frm.receiver_name.value = frm.orderer_name.value;
	frm.receiver_mobile1.value = frm.orderer_phone1_1.value;
	frm.receiver_mobile2.value = frm.orderer_phone1_2.value;
	frm.receiver_mobile3.value = frm.orderer_phone1_3.value;
	frm.receiver_phone1.value = frm.orderer_phone2_1.value;
	frm.receiver_phone2.value = frm.orderer_phone2_2.value;
	frm.receiver_phone3.value = frm.orderer_phone2_3.value;
	frm.post1.value = frm.memberAddressZipcode1.value;
	frm.post2.value = frm.memberAddressZipcode2.value;
	frm.address1.value = frm.memberAddressAddr1.value;
	frm.address2.value = frm.memberAddressAddr2.value;
	//frm.receiver_request.focus();
}

function ResetAddress() {
	frm = document.myform;
	frm.post1.value = "";
	frm.post2.value = "";
	frm.address1.value = "";
	frm.address2.value = "";
}

function ResetAddressAll() {
	frm = document.myform;
	frm.receiver_name.value = "";
	frm.receiver_phone1.value = "";
	frm.receiver_phone2.value = "";
	frm.receiver_phone3.value = "";
	frm.receiver_mobile1.value = "";
	frm.receiver_mobile2.value = "";
	frm.receiver_mobile3.value = "";
	frm.post1.value = "";
	frm.post2.value = "";
	frm.address1.value = "";
	frm.address2.value = "";
	frm.receiver_name.focus();
}

function AddressManage() {
	window.open("/mypage/addressManage.html", "addManage", "left=50,top=50,width=598,height=339,scrollbars=yes,status=no");
}
</script>
<div class="section">
	<div class="tit">
		<img src="images/order_step_02.png">
	</div>

	
	<div class="line">
		<div class="tit">보내시는 분</div>
		<div class="content_wrap">
			<div class="content"><input type="text" name="orderer_name" class="input_info mid" value=""></div>
		</div>
	</div>
	<div class="line">
		<div class="tit">└ 연락처 1 (문자수신)</div>
		<div class="content_wrap">
			<div class="content"><input name="orderer_phone1_1" type="text" class="input_info"> - <input name="orderer_phone1_2" type="text" class="input_info"> - <input name="orderer_phone1_3" type="text" class="input_info"></div>
			<div class="content sub">· 해당 번호로 택배관련 및 무통장입금 결제시 문자가 발송됩니다.</div>
		</div>
	</div>
	<div class="line">
		<div class="tit">└ 연락처 2</div>
		<div class="content_wrap">
			<div class="content"><input name="orderer_phone2_1" type="text" class="input_info"> - <input name="orderer_phone2_2" type="text" class="input_info"> - <input name="orderer_phone2_3" type="text" class="input_info"></div>
			<div class="content sub">· 연락처 1, 2 둘 중 하나는 꼭 입력해주세요.</div>
		</div>
	</div>
	<div class="line">
		<div class="tit">└ 이메일</div>
		<div class="content_wrap">
			<div class="content"><input type="text" name="orderer_email" class="input_info mid" value=""></div>
		</div>
	</div>
	
	<div class="line">
		<div class="tit">받으시는 분</div>
		<div class="content_wrap">
			<div class="content"><input name="receiver_name" type="text" class="input_info mid"></div>
			<div class="btn chd" onclick="ChangeAddress1()" style="margin-left: 3px;">보내시는 분과 동일</div>
			<div class="btn chd" onclick="ResetAddressAll()">배송지 정보 비우기</div>
					</div>
	</div>
	<div class="line">
		<div class="tit">연락처 1 (문자수신)</div>
		<div class="content_wrap">
			<div class="content"><input name="receiver_mobile1" type="text" class="input_info"> - <input name="receiver_mobile2" type="text" class="input_info"> - <input name="receiver_mobile3" type="text" class="input_info"></div>
			<div class="content sub">· 해당 번호로 택배관련 및 무통장입금 결제시 문자가 발송됩니다.</div>
		</div>
	</div>
	<div class="line">
		<div class="tit">연락처 2</div>
		<div class="content_wrap">
			<div class="content"><input name="receiver_phone1" type="text" class="input_info"> - <input name="receiver_phone2" type="text" class="input_info"> - <input name="receiver_phone3" type="text" class="input_info"></div>
			<div class="content sub">· 연락처 1, 2 둘 중 하나는 꼭 입력해주세요.</div>
		</div>
	</div>
	<div class="line">
		<div class="tit elong">배송지 주소</div>
		<div class="content_wrap">
			<div class="content">
				<input name="post1" id="post1" type="text" class="input_info" readonly="" onclick="set_postcode()" style="background:#EFEFEF"> - <input name="post2" id="post2" type="text" class="input_info" readonly="" onclick="set_postcode()" style="background:#EFEFEF">
			</div>
			<div class="btn chd" onclick="set_postcode()">통합주소검색</div>
			<div class="btn chd" onclick="set_postcode_old()">구주소검색</div>
			<div class="btn chd" onclick="ResetAddress()">주소비우기</div><br>
			<div class="content" style="line-height:28px">
				<input name="address1" id="address1" type="text" class="input_info long chd" readonly="" onclick="set_postcode()" style="background:#EFEFEF"><br>
				<input name="address2" id="address2" type="text" class="input_info long">
			</div>
		</div>
	</div>
	<!-- <div class="line">
		<div class="tit elong">배송지 주소</div>
		<div class="content_wrap" >
			<div class="content">
				<input name="post1" id="post1" type="text" class="input_info" style="background:#EFEFEF"
				> - <input name="post2" id="post2" type="text" class="input_info" style="background:#EFEFEF">
			</div>
			<div class="btn chd" onclick="set_postcode()">주소검색</div><div class="btn chd" onclick="ResetAddress()">주소비우기</div><br>
			<div class="content" style="line-height:28px">
				<input name="address1" id="address1" type="text" class="input_info long chd" style="background:#EFEFEF"><br>
				<input name="address2" id="address2" type="text" class="input_info long">
			</div>
		</div>
	</div> -->
	<div class="line">
		<div class="tit long">택배사 선택</div>
		<div class="content_wrap">
			<div class="content radio"><input type="radio" id="delivery1" name="delivery_company" value="CJ"><label for="delivery1"><img src="images/delivery_cj.png"></label> <br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold; color: red; font-size: 12pt;">5월 4일 발송 불가</span><span style="font-size: 12pt">, 7일 출발</span></div>
			<div class="content radio"><input type="radio" id="delivery2" name="delivery_company" value="현대"><label for="delivery2"><img src="images/delivery_h.png"></label> <br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 12pt">5월 4일 출발 (발송)가능</span></div>
		</div>
	</div>

	
		<div class="line">
		<div class="tit exlong" style="height: 211px; vertical-align: top;">남기실 말씀</div><!-- 120 / 211 -->
		<div class="content_wrap" style="vertical-align: top;">
			<div class="content ta"><textarea name="receiver_request" class="input_text long" placeholder="주문/배송 관련 요청사항 또는 펜던트 주문시 인쇄 내용을 남겨주세요."></textarea></div>
			<div class="content sub">
				<label><input type="checkbox" name="pack_sheet" value="1"> <span class="bold">주문 내역서</span> 동봉요청 (주문 내역서가 필요한 경우 체크해주세요.)</label>
			</div>
			<!-- <div style="width: 810px;color: #666; border-top: 1px dashed #ccc; padding: 15px 0px 10px 10px; line-height:160%"> -->
				<!--
				<span style="color:#666; font-weight: bold;">● 사료샘플 요청</span><br>
				<span style="padding-left:20px;  color: #666;">남기실 말씀에 샘플을 요청하실 경우 준비되어 있는 샘플을 보내드립니다. 샘플이 준비되지 못한 경우도 있을 수 있습니다. 미리 양해 구합니다.</span>
				-->
		 <!-- </div>  -->
<!-- 			<div style="width: 810px;color: #666; border-top: 1px dashed #ccc; padding: 15px 0px 10px 10px; line-height:160%">
				<span style="color:#666; font-weight: bold;">● 코리아펫쇼 무료 입장권 + 할인권 신청</span><br>
				<div style="padding-left:10px;  color: #666;"> 3.16 -18 서울 양재 aT센터에서 열리는 코리아펫쇼 <b>무료 입장권 1매 (1매 1인 사용) + 3,000원 할인권</b>을  드립니다. <br>필요하신 분은 남기실 말씀에 신청해주세요!</div>
			 </div> -->
			<!--div class="content sub">
				<label><input type="checkbox" name="pack_sample" value="1"> 무료 사료샘플 요청 (종류 임의)</label>
			</div-->
	</div>
	
</div>


<!-- 결제정보 -->
<div class="section">
	<div class="tit">
		<img src="images/order_step_03.png">
	</div>
	<div class="pay_wrap">
		<div class="left">

			<!-- 결제수단 선택 -->
			<div class="content_wrap">
				<div class="tit"><img src="images/order_pay_t2.png"></div>
				<div class="line_pay">

					
					<div class="radio_wrap"><label><input type="radio" name="pay_method" value="kcp_card" checked=""> 신용카드</label></div>
					<div class="radio_wrap"><label><input type="radio" name="pay_method" value="kcp_bank"> 실시간 계좌이체(수수료 없음)</label></div>
					<div class="radio_wrap"><label><input type="radio" name="pay_method" value="bank"> 무통장입금</label></div>
					<div class="radio_wrap"><input type="radio" name="pay_method" id="pm_payco" value="payco"> <label for="pm_payco"><span id="payco_btn_type_A1"><img src="https://static-bill.nhnent.com//payco/checkout/img/v2/btn_type/EASYPAY_A1.png" width="103" height="14" style="width:auto;vertical-align:middle"></span></label></div>
					<!--div class="radio_wrap"><label><input type="radio" name="pay_method" value="kcp_card_with_okcashbag"> OK 캐쉬백 (+신용카드)</label></div-->
					<div class="radio_wrap"><label><input type="radio" name="pay_method" value="kcp_bank_escrow"> 실시간 계좌이체(에스크로)</label></div>

					
				</div>
				<div class="line_pay_help">

					
					<div class="pay_method_info" data="kcp_card" style="text-align: center;"><!-- 신용카드 -->
						<a href="/shop/shop_event_detail.html?pde_id=2077" target="_blank"><img src="/images/cart_payco_banner.png"></a><br><br>
<!-- 						<img src="/img/201705_shinhancard_s.jpg"><br>						
						<img src="/img/201705_shinhancard_03.jpg" width="570"><br> -->
						<img src="/images/KCP-event.gif">
					</div>
					<div class="pay_method_info" data="kcp_bank" style="display:none">
						- 결제하기 버튼을 클릭 후 결제창에서 통장정보를 입력하시면 주문과 동시에 결제가 완료됩니다.<br>
						- 통장 예금주 본인의 공인 인증서를 필요로 합니다. (은행에 따라 보안/OPT카드 사용)<br><br>
						<img src="http://queenpuppy.co.kr/images/cart_payco_banner.png"><br>
						<!--img src="http://queenpuppy.co.kr/images/KCP-event.gif"-->
					</div>
					<div class="pay_method_info" data="bank" style="display:none">
						- 폰뱅킹, 인터넷 뱅킹 등 고객님이 직업 이체해주시는 결제방법입니다. <br>
						<span style="font-size: 11px; color:#c6146a; font-weight:bold;">- 무통장입금 확인은 평일 오전 9시30분부터 오후 6시까지, 토요일은 2시까지, 약 2시간정도마다 시행됩니다.</span><br>
						- 현금영수증은 배송이 완료되고 난 뒤 해당 주문 조회 페이지에서 신청하실 수 있습니다<br>
						- 무통장주문후 15일이 지날때까지 입금이 안되면 주문은 자동으로 취소됩니다. <br><br>
						<img src="http://queenpuppy.co.kr/images/cart_payco_banner.png"><br>
						<!--img src="http://queenpuppy.co.kr/images/KCP-event.gif"-->
					</div>
					<div class="pay_method_info" data="payco" style="display:none">
						- PAYCO는 NHN엔터테인먼트가 만든 안전한 간편결제 서비스입니다.<br>
						- 휴대폰과 카드 명의자가 동일해야하며, 결제금액 제한은 없습니다. (지원카드: 모든 국내 신용/체크카드)<br><br>
						<a href="/shop/shop_event_detail.html?pde_id=2077" target="_blank"><img src="http://queenpuppy.co.kr/images/cart_payco_banner.png"></a><br>
						<!--img src="http://queenpuppy.co.kr/images/KCP-event.gif"-->
					</div>
					<!--div class="pay_method_info" data="kcp_card_with_okcashbag" style="display:none">
						- 퀸앤퍼피에서 편리하게 OK캐쉬백 사용하세요! OK 캐쉬백과 신용카드 복합 결제 가능합니다. <br><br>
						<img src="http://queenpuppy.co.kr/images/cart_payco_banner.png"><br>
					</div-->
					<div class="pay_method_info" data="kcp_bank_escrow" style="display:none">
						에스크로는 공정거래위원회의 기준을 충족하는 신뢰성 있는 에스크로 사업자에게 대금결제를 한 후 상품을 수령한 후에, ‘수령확인’을 한 경우, 에스크로 사업자가 쇼핑몰에 결제대금을 지급하여 소비자의 구매 안전을 도모하는 제도입니다. ([전자상거래 등에서의 소비자 보호에 관한 법률 시행령 개정안, 2006.2.22]에 따릅니다)<br><br>

						- 통장 예금주의 개인정보 (생년월일, 주민등록번호 (사업자 번호), 핸드폰 번호) 등이 필요합니다.<br>
						- 이체를 위해 보안/OPT카드가 필요하며 통장 예금주 본인의 공인 인증서를 필요로 합니다.<br><br>
						<img src="http://queenpuppy.co.kr/images/cart_payco_banner.png"><br>
						<!--img src="http://queenpuppy.co.kr/images/KCP-event.gif"-->
					</div>

					
				</div>
			</div>
		</div>

		<!-- 최종결제금액 -->
		<div class="right">
			<div class="content_wrap">
				<div class="tit"><img src="images/order_pay_t3.png"></div>
				<div class="content">
					<div class="line head">
						<div class="tit">총구매금액</div>
						<div class="content bold">32,940원</div>
					</div>
										<div class="line">
						<div class="tit">배송비</div>
						<div class="content">+ 0원</div>
					</div>
															<div class="line_total">
						<div class="tit">최종 결제 금액</div>
						<div class="content">32,940원</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap">
				<div class="left"><a href="/shop/cart.html"><img src="images/pay_btn_02.png" onmouseover="this.src='images/pay_btn_02_m.png';" onmouseout="this.src='images/pay_btn_02.png';"></a></div>
				<div class="right"><input type="image" src="images/pay_btn_03.png" onmouseover="this.src='images/pay_btn_03_m.png';" onmouseout="this.src='images/pay_btn_03.png';"></div>
			</div>
		</div>

	</div>
</div>



<!--SETTLEMENT-->
<script type="text/javascript">

function CheckGift() {

	
	var chk_count = 0;
	var selected = 0;
	var selected_id = "";
	var selected_cost = "";
	var selected_product = "";
	var selected_price = "";

	var g = $("input:radio[name='Gift']");

	for(i = 0; i < g.length; i++) {
		if(g.eq(i).is(":checked")) {
			chk_count = 1;
			selected = i;
			selected_id = g.eq(i).val();
			selected_cost = $("input:hidden[name='Gift" + i + "Cost']").val();
			selected_product = $("input:hidden[name='Gift" + i + "Product']").val();
			selected_price = $("input:hidden[name='Gift" + i + "TypePrice']").val();
			break;
		}
	}
	if(chk_count == 0) {
		alert("구매사은품을 선택해 주세요.");
		g.eq(0).focus();
		return false;
	}

	var gs = $("input:hidden[name='hasGift" + selected + "Select']");
	var stext = "";
	var soption = "";
	if(gs.val() == "Y") {
		soption = $("select[name='Gift" + selected + "Select']").val();
		if(soption == "") {
			alert("선택하신 구매사은품 중에서 종류를 선택해 주세요.");
			return false;
		}
		stext = "&nbsp;<b>(선택사항 : " + soption + ")</b>";
	}

	$("input:hidden[name='orderGift']").val(selected_id);
	$("input:hidden[name='orderGiftCost']").val(selected_cost);
	$("input:hidden[name='orderGiftSelectValue']").val(soption);
	$("input:hidden[name='orderGiftProduct']").val(selected_product + stext);
	$("input:hidden[name='orderGiftTypePrice']").val(selected_price);

	return true;

}


var is_submit = false;

function CheckForm(frm) {

	//if(is_submit) return false;
	is_submit = true;

	if(CheckGift() == false) {
		is_submit = false;
		return false;
	}

	if(!frm.orderer_name.value.length) {
		alert("주문하시는 분 성함을 입력해 주세요.");
		is_submit = false;
		return false;
	}

	if(!frm.receiver_name.value.length) {
		alert("받으시는 분 성함을 입력해 주세요.");
		is_submit = false;
		return false;
	}

	// 수신자 전화번호를 먼저 체크 2017-04-04
	var phoneLen1 = frm.receiver_phone1.value.length + frm.receiver_phone2.value.length + frm.receiver_phone3.value.length;
	var phoneLen2 = frm.receiver_mobile1.value.length + frm.receiver_mobile2.value.length + frm.receiver_mobile3.value.length;
	if(phoneLen1 < 7 && phoneLen2 < 7) {
		alert("받으시는 분 전화번호나 핸드폰번호를 입력해 주세요.");
		is_submit = false;
		return false;
	}

	// 주문자 전화번호가 없다면 에러내지 말고 그냥 수신자를 대입 2017-04-04
	var phoneLen3 = frm.orderer_phone1_1.value.length + frm.orderer_phone1_2.value.length + frm.orderer_phone1_3.value.length;
	var phoneLen4 = frm.orderer_phone2_1.value.length + frm.orderer_phone2_2.value.length + frm.orderer_phone2_3.value.length;
	if(phoneLen3 < 7 && phoneLen4 < 7) {
		frm.orderer_phone1_1.value = frm.receiver_phone1.value;
		frm.orderer_phone1_2.value = frm.receiver_phone2.value;
		frm.orderer_phone1_3.value = frm.receiver_phone3.value;
		frm.orderer_phone2_1.value = frm.receiver_mobile1.value;
		frm.orderer_phone2_2.value = frm.receiver_mobile2.value;
		frm.orderer_phone2_3.value = frm.receiver_mobile3.value;
	}

	if((frm.post1.value.length + frm.post2.value.length) < 5) {
		alert("주소찾기버튼을 눌러 우편번호를 입력해 주세요.");
		is_submit = false;
		return false;
	}

	if(!frm.address1.value.length) {
		alert("기본주소를 입력해 주세요.");
		is_submit = false;
		return false;
	}

	if(!frm.address2.value.length) {
		alert("상세주소를 입력해 주세요.");
		is_submit = false;
		return false;
	}

	if(!frm.delivery_company[0].checked && !frm.delivery_company[1].checked) {
		alert("배송받으시기를 원하는 택배사를 입력해 주세요.\r\n\r\n<CJ택배>와 <롯데택배(구 현대)> 중 하나를 선택하실 수 있습니다.");
		is_submit = false;
		return false;
	}

	var save_address = "";
	var pack_sheet = "";
	var pack_sample = "";

	if($("input:checkbox[name='save_address']:checked").length > 0) save_address = 1;
	if($("input:checkbox[name='pack_sheet']:checked").length > 0) pack_sheet = 1;
	if($("input:checkbox[name='pack_sample']:checked").length > 0) pack_sample = 1;

	
	
	var bSel = false;
	var pay_method_value = "";
	for(var i = 0; i < frm.pay_method.length; i++) {
		if(frm.pay_method[i].checked) {
			bSel = true;
			pay_method_value = frm.pay_method[i].value;
		}
	}

	if(!bSel) {
		alert("결제수단을 선택해 주세요.");
		is_submit = false;
		return false;
	}

	if(pay_method_value == "payco") {

		var data = {};
		data.orderGift = frm.orderGift ? frm.orderGift.value : "";
		data.orderGiftCost = frm.orderGiftCost ? frm.orderGiftCost.value : "";
		data.orderGiftProduct = frm.orderGiftProduct ? frm.orderGiftProduct.value : "";
		data.orderGiftTypePrice = frm.orderGiftTypePrice ? frm.orderGiftTypePrice.value : "";
		data.orderer_name = frm.orderer_name.value;
		data.orderer_phone1_1 = frm.orderer_phone1_1.value;
		data.orderer_phone1_2 = frm.orderer_phone1_2.value;
		data.orderer_phone1_3 = frm.orderer_phone1_3.value;
		data.orderer_phone2_1 = frm.orderer_phone2_1.value;
		data.orderer_phone2_2 = frm.orderer_phone2_2.value;
		data.orderer_phone2_3 = frm.orderer_phone2_3.value;
		data.orderer_email = frm.orderer_email.value;
		data.receiver_name = frm.receiver_name.value;
		data.receiver_phone1 = frm.receiver_phone1.value;
		data.receiver_phone2 = frm.receiver_phone2.value;
		data.receiver_phone3 = frm.receiver_phone3.value;
		data.receiver_mobile1 = frm.receiver_mobile1.value;
		data.receiver_mobile2 = frm.receiver_mobile2.value;
		data.receiver_mobile3 = frm.receiver_mobile3.value;
		data.post1 = frm.post1.value;
		data.post2 = frm.post2.value;
		data.address1 = frm.address1.value;
		data.address2 = frm.address2.value;
				data.pack_sheet = pack_sheet;
		data.pack_sample = pack_sample;
		data.save_address = save_address;
		data.receiver_request = frm.receiver_request.value;
		data.delivery_company = frm.delivery_company[0].checked ? "CJ" : "현대";
		data.pay_method = pay_method_value;

		OrderPayCo(data);
		return false;

	}
	
}

</script>

<!--PAYCO-->
<script type="text/javascript" src="https://static-bill.nhnent.com/payco/checkout/js/payco.js" charset="UTF-8"></script>
<script type="text/javascript">

function OrderPayCo(data) {

	// DB에 주문등록 후 주문번호를 받아 PAYCO 호출
	// 개인정보전송이기 때문에 https를 사용해야 하고,
	// 크로스도메인이 되어 버리기 때문에 jsonp를 사용해야 한다.

	$.ajax({
		type: "POST",
		dataType: "jsonp",
		data: data,
		url: "/shop/order2_payco.php",
		crossdomain: true,
		success: function(json, textStatus, jqXHR) {

			if(json.code != "200") {
				alert("서버응답: "+json.msg);
				return;
			}

			// 선택박스 필수 옵션을 체크 함
			var Params = "customerOrderNumber=" + json.od_no; //가맹점고객주문번호 입력

			// localhost 로 테스트 시 크로스 도메인 문제로 발생하는 오류
			$.support.cors = true;

			// + "&" + $('order_product_delivery_info').serialize() );
			$.ajax({
				type: "POST",
				url: "http://queenpuppy.co.kr/shop/payco/payco_reserve.php",
				data: Params, // JSON 으로 보낼때는 JSON.stringify(customerOrderNumber)
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType: "json",
				success: function(data) {
					if(data.code == "0") {
						//console.log(data.result.reserveOrderNo);
						//$('#order_num').val(data.result.reserveOrderNo);
						//$('#order_url').val(data.result.orderSheetUrl);
						var orderurl = data.result.orderSheetUrl;
						window.open(orderurl, "popupPayco", "top=100, left=300, width=727px, height=512px, resizble=no, scrollbars=yes");
					} else {
						console.log(data);
						alert("code:" + data.code + "\n" + "message:" + data.message);
					}
				},
				error: function(request,status,error) {
					//에러코드
					alert("code:" + status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					return false;
				}
			});
		},
		error: function (jqXHR, textStatus, errorThrown) {
			console.log(jqXHR);
			alert("Error : " + textStatus + " / " + errorThrown);
		}
	});

}

$(function() {

	// 결제수단별 이벤트 배너 스왑
	$("input:radio[name='pay_method']").on("click", function() {
		var value = $("input:radio[name='pay_method']:checked").val();
		$(".pay_method_info").hide(0);
		$("div[data='" + value + "']").show(0);
	});

	// 페이코 버튼 생성
	Payco.Button.register({
		SELLER_KEY : "PUPPY",
		ORDER_METHOD : "EASYPAY",
		BUTTON_TYPE : "A1",
		BUTTON_HANDLER : OrderPayCo,
		DISPLAY_PROMOTION : "Y",
		DISPLAY_ELEMENT_ID : "payco_btn_type_A1"
	});

});

</script>


	</div></form><!--content_wrap-->
</div><!--body_wrap-->


<!-- footer -->
<div style="height: 30px;"></div>

<div class="footer_wrap">
	<div class="footer_box1">
		<div class="footer_box1_line"><img src="/img/footer_tel.gif"></div>
		<div class="footer_box1_line">
			<a href="/board/list.html?db=cs"><img src="/img/footer_board.gif" onmouseover="this.src=&quot;/img/footer_board_m.gif&quot;" onmouseout="this.src=&quot;/img/footer_board.gif&quot;"></a>
		</div>
		<div>
			<a href="/csinfo/guide.html#bank"><img src="/img/footer_bank.gif" onmouseover="this.src=&quot;/img/footer_bank_m.gif&quot;" onmouseout="this.src=&quot;/img/footer_bank.gif&quot;"></a>
		</div>
	</div>
	<div class="footer_box2">
		<div class="footer_box2_1">
			<div class="footer_box2_1_tit">
				인기코너
			</div>
			<div class="footer_box2_1_con">
					<div><a href="/shop/shop_coupon.html" class="linkType_1">창고정리</a></div>
					<div>	<a href="/shop/shop_event_list.html?type=exp" class="linkType_1">신상품 무료체험</a></div>
					<div><a href="/oneday/index.html" class="linkType_1">하루팔이</a></div>
					<div><a href="/shop/shop_special.html" class="linkType_1">이달의 한정할인</a></div>
					<div><a href="/shop/shop_set.html" class="linkType_1">세트할인</a></div>
					<div><a href="/shop/afternote.html" class="linkType_1">사용후기</a></div>
					<div><a href="/shop/shop_event.html" class="linkType_1">이벤트</a></div>
			</div>
		</div>
		<div class="footer_box2_2">
			<div class="footer_box2_2_tit">
				<a href="/shop/shop_brand.html" class="linkType_2">브랜드샵</a>
			</div>
			<div class="footer_box2_2_con_wrap">
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1178" class="linkType_1">개에게 적합한 자연식을 본뜬 육류 위주의 식품, <span style="color:#666; font-weight: bold;">아카나</span></a><span class="tag_new">N</span></div>
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1159" class="linkType_1">평생건강을 위해 알갱이 모양까지 신경 쓴, <span style="color:#666; font-weight: bold;">내추럴발란스</span></a><span class="tag_new">N</span></div>
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1197" class="linkType_1">이태리 Cosmetica Veneta Srl사의 프리미엄 샴푸, <span style="color:#666; font-weight: bold;"> YUUP!</span></a><span class="tag_new">N</span></div>
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=595" class="linkType_1">미국 PETCO 사료 카테고리 베스트셀러, <span style="color:#666; font-weight: bold;">블루버팔로</span></a><span class="tag_new">N</span></div>
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1106" class="linkType_1">하나둘셋 입고, 하나둘셋 벗고, 착용이 간편한 <span style="color:#666; font-weight: bold;">트레폰티</span></a></div>
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=970" class="linkType_1">흡수제 듬뿍 더올림 패드와 프리미엄 수제간식 <span style="color:#666; font-weight: bold;">우리아지</span></a></div>
				<div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1006" class="linkType_1">안전 등급의 성분만으로 만든 저작극 샴푸, <span style="color:#666; font-weight: bold;">하이포닉</span></a></div>

				<!-- <div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=965"  class="linkType_1">영양학적으로 완벽한 밸런스의 반려동물사료, <span style='color:#666; font-weight: bold;'>로얄캐닌</span></a></div> -->
				<!-- <div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1141"  class="linkType_1">에베레스트산에서 찾아낸 100% 천연치즈, <span style='color:#666; font-weight: bold;'>히말라야도그츄</span></a></div> -->
				<!-- <div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=489"  class="linkType_1">미국 시장 판매 1위 다목적 세정제, <span style='color:#666; font-weight: bold;'>파인솔</span></a></div> -->
				<!-- <div class="footer_box2_2_con">ㆍ<a href="/shop/shop_brand_sub.html?pdb_id=1013"  class="linkType_1">직구 고민 끝! 오래 씹는 천연성분 덴탈껌, <span style='color:#666; font-weight: bold;'>윔지스</span></a></div> -->

				<div class="footer_box2_2_con" style="padding-left: 10px;"><a href="/shop/shop_brand.html" class="linkType_ba">브랜드샵 전체보기 ▶</a></div>
			</div>
		</div>
		<div class="footer_box2_3">
			<div class="footer_box2_3_tit">
				퀸앤퍼피 SNS
			</div>
			<div class="footer_box2_3_con">
				<div><a href="http://blog.naver.com/queenpuppy" class="linkType_1" target="_blank"><img src="/img/blet_blog.png"> 네이버 블로그</a></div>
				<div><a href="http://cafe.naver.com/qpholic" class="linkType_1" target="_blank"><img src="/img/blet_cafe.png"> 네이버 카페</a></div>
				<div><a href="http://m.post.naver.com/my.nhn?memberNo=2949813" class="linkType_1" target="_blank"><img src="/img/blet_post.png"> 네이버 포스트</a></div>
				<div><a href="http://band.us/@queenpuppy" class="linkType_1" target="_blank"><img src="/img/blet_band.png"> BAND</a></div>
				<div><a href="https://story.kakao.com/ch/queenpuppy" class="linkType_1" target="_blank"><img src="/img/blet_kakao.png">
				카카오채널</a></div>
				<div><a href="https://www.facebook.com/QueenPuppy2013" class="linkType_1" target="_blank"><img src="/img/blet_facebook.png">
				페이스북</a></div>
				<div><a href="http://www.instagram.com/queenpuppy.co.kr/" class="linkType_1" target="_blank"> <img src="/img/blet_insta.png"> 인스타그램</a></div>
				<div><a href="http://twitter.com/queennpuppy" class="linkType_1" target="_blank"><img src="/img/blet_twitter.png"> 트위터</a></div>

			</div>
		</div>
		<div class="footer_box2_4">
			<div class="footer_box2_4_tit">
				<a href="/board/list.html?db=hotissue" class="linkType_2">쇼핑뉴스</a>
			</div>
			<div class="footer_box2_4_con">
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=634" class="linkType_1">2018년 5월 카드 무이자할...</a></div>
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=633" class="linkType_1">5월 5~7일 연휴관련 택배일...</a></div>
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=619" class="linkType_1">[모바일결제] 카카오페이로...</a></div>
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=597" class="linkType_1">페이코 포인트로 결제 시 3...</a></div>
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=580" class="linkType_1">퀸앤퍼피 iOS앱 출시</a></div>
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=576" class="linkType_1">퀸앤퍼피 안드로이드앱 출...</a></div>
								<div>ㆍ<a href="/board/read.html?db=hotissue&amp;id=555" class="linkType_1">강아지사랑퀸앤퍼피 - 카카...</a></div>
							</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function ViewEscrow() {
	var status = "width=500,height=450,menubar=no,scrollbars=no,resizable=no,status=no";
	var pop = window.open("http://admin.kcp.co.kr/Modules/escrow/kcp_pop.jsp?site_cd=D1355", "view_escrow", status);
}
function ViewBizNum() {
	var status = "width=750,height=700,menubar=no,scrollbars=no,resizable=no,status=no";
	var obj = window.open("http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208756003", "view_biznum", status);
}
</script>

<div class="footer_wrap2">
	<div class="footer_wrap2_1">
		<div class="f2_group1">
			<div class="f2_group1_menu"><a href="/csinfo/about.html" class="linkType_3">회사소개</a></div>
			<div class="f2_group1_menu"><a href="/csinfo/guide.html" class="linkType_3">이용안내</a></div>
			<div class="f2_group1_menu"><a href="/csinfo/way.html" class="linkType_3">찾아오시는 길</a></div>
			<div class="f2_group1_menu_last"><a href="/csinfo/partner.html" class="linkType_3">제휴 및 입점안내</a></div>
		</div>
		<div class="f2_group2">
			<div class="f2_group2_menu"><a href="/csinfo/service.html" class="linkType_4">서비스 이용약관</a></div>
			<div class="f2_group2_menu_last"><a href="/csinfo/personal.html" class="linkType_4"><span style="color:#c6146a;">개인정보 취급방침</span></a></div>
		</div>
		<div class="f2_group3">
			<div class="f2_group3_content"><img src="/img/f2_group3_content_blet.gif"> 이메일주소 무단수집 거부</div>
		</div>
	</div>
	<div class="footer_wrap2_2">
		<div class="f2_group4">
			<div class="footer_info1">(주) 퀸앤퍼피</div>
			<div class="footer_info2">
				(10329) 경기 고양시 일산동구 성석동 904-1  <br>
				전화 : 1666-1147 &nbsp;&nbsp;| &nbsp;&nbsp;팩스 : 070-7159-3522 &nbsp;&nbsp;| &nbsp;&nbsp;이메일 : queenpuppy@naver.com<br>
				대표이사 : 정석근 ceo@queenpuppy.co.kr | 개인정보보호책임자 : 곽재정 star@queenpuppy.co.kr<br>
				사업자 등록번호 : <a href="javascript:;" onclick="ViewBizNum()">120-87-56003</a>  <a href="javascript:;" onclick="ViewBizNum()" style="background:#ccc; color:#fff; font-size: 11px; border-radius:2px; padding: 3px;">사업자정보확인</a>&nbsp;|&nbsp;통신판매업신고 : 제2012-고양일산동-0214호<br><br>

				<span style="color:#333;">Copyright (주)퀸앤퍼피 all rights reserved, since 2002. </span><br>
				퀸앤퍼피의 모든 저작물의 저작권은 퀸앤퍼피에 있으며, 무단복제나 도용은 저작권법에 의해 금지되어<br>있습니다. 이를 위반할 경우에는 법적인 처벌을 받을 수 있습니다.<br><br>
				<span style="font-weight: bold; color:#666;">퀸앤퍼피</span>는 (주)퀸앤퍼피의 회사명이며, 법적으로 보호받는 상표권입니다.
			</div>
		</div>
		<div class="f2_group5">
			<div style="padding-bottom: 10px;"><img src="/img/footer_banner_01.png"></div>
			<div style="padding-bottom: 10px;"><a href="javascript:;" onclick="ViewEscrow()"><img src="/img/footer_banner_02.png"></a></div>
			<div><img src="/img/footer_banner_06.png"></div>
		</div>
		<div class="f2_group6">
			<div style="padding-bottom: 10px;"><img src="/img/footer_banner_03.png"></div>
			<div style="padding-bottom: 10px;"><img src="/img/footer_banner_04.png"></div>
			<div><img src="/img/footer_banner_05.png"></div>
		</div>
	</div>
</div>

<div class="chooseDialog" id="chooseDialog"></div>
<br>


<!-- 다음 DDN 리타겟팅 스크립트 -->
<script type="text/javascript">
var roosevelt_params = {
    retargeting_id:'RBcNtJqs2SYku22EfiVTNg00',
    tag_label:'MvvZfkGHQge2jGU3vfVQdw'
};
</script>
<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async=""></script>
<!-- 다음 DDN 리타겟팅 스크립트 -->


<!-- 네이버 프리미엄 로그분석 -->
<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
<script type="text/javascript">
wcs_do(_nasa);
</script>
<!-- 네이버 프리미엄 로그분석 -->


<!-- 모비온 스크립트 -->
<script type="text/javascript">
var rf = new EN();
rf.setData("sc", encodeURIComponent(""));
rf.sendRf();
</script>
<!-- 모비온 스크립트 -->


<!-- WIDERPLANET  SCRIPT START 2017.5.13 -->
<div id="wp_tg_cts" style="display:none;"><script id="wp_id_script_1525392421338" src="//altg.widerplanet.com/delivery/wp.js"></script><script id="wp_tag_script_1525392421471" src="//astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1dd8j1s-vufi2m-3-1&amp;eid=4-1dc3e4d99e468701fb07263e2566c568a0776f6c986d4da02655f87ec377beace2b536cc8a49c04aa16d8672572ead2eefed063936bf08c6afd4c095306e058874522e5320c26bec317cc1e02a76fad2&amp;ty=Home&amp;ti=35611&amp;device=web&amp;charset=EUC-KR&amp;tc=1525392421471&amp;ref=http%3A%2F%2Fqueenpuppy.co.kr%2Fshop%2Forder1.html&amp;loc=http%3A%2F%2Fqueenpuppy.co.kr%2Fshop%2Forder2.html"></script></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid: "",
		ti: "35611",
		ty: "Home",
		device: "web"
	};
}));
</script>
<script type="text/javascript" async="" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2017.5.13 -->


<script type="text/javascript">
$(function() {
	if(exec_lazy_loading_tail) {
		$("img.lazy").lazyload({ effect : "fadeIn", skip_invisible : true });
	}
});
</script>




</div><canvas id="__gesture_canvas__" width="0" height="0" style="z-index: 100000000; position: fixed; background: transparent !important; top: 0px; left: 0px;"></canvas><span id="__gesture_preview__" style="z-index: 100000001; position: absolute; background: rgba(255, 255, 225, 0.85); margin: 0px; border: 1px solid black; white-space: nowrap; display: none;"></span></body>