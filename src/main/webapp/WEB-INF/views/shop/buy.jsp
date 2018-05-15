<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.tit{margin-top:7px; padding:5px; margin-left:10px;}
.paypay{padding:3px;}
.content{margin-left:10px;}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
window.onload=function(){
	load();
	totalpay();
	
}


function pay(){
	 var radio = $(':input[name=pay_method]:radio:checked').val();
	if(radio=="card"){
		 var accprice=$("#finalpay").text();
			form=document.getElementById("pay");
			form.action="<c:url value='/shop/pay?accprice="+accprice+"'/>";
			form.submit(); 
	}else if(radio=="bank"){
		 var accprice=$("#finalpay").text();
			form=document.getElementById("pay");
			form.action="<c:url value='/shop/bank?accprice="+accprice+"'/>";
			form.submit(); 
	}
	

}

function load(){
	var a;
	var b;
	var c=new Array();
	$(".price1").each(function(i){
		a = parseInt(removeComma($(this).text()));
		$(".cnt").each(function(j){
			if(i==j){
			b=parseInt(removeComma($(this).text()));
				c[i]=a*b;				
			}
		})
	});
	
	$(".price").each(function(i){
		$(this).val(Comma(c[i])+"원");

	});
	
	}
	
	function totalpay(){
		sum=0;
		$(".price").each(function(){
			sum+=parseInt(removeComma($(this).val()));
		});
		if(sum>50000){
		$("#delivery").text("0원");
		$("#totalpay").text(Comma(sum)+"원");
		$("#finalpay").text(Comma(sum)+"원");
		}else{
			$("#delivery").text("3,000원");
			$("#totalpay").text(Comma(sum)+"원");
			$("#finalpay").text(Comma(sum+3000)+"원");
			
		}
		
	}

function Comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function removeComma(n) {
      var txtNumber = '' + n;
      return txtNumber.replace(/(,)/g, "");
   }
</script>
<div id="wrap1" style="width:1000px; margin: auto;">
  <div>
<img src="<c:url value='/resources/itemimage/order_t.png'/>">
</div>
<div style="width:100%; background-color: green; height: 8px;">
</div>



<form id="pay" method="post"  action="<c:url value='/shop/pay'/>">
<table>
		<colgroup>
			<col width="90">
			<col width="354">
			<col width="125">
			<col width="90">
			<col width="130">
		
		</colgroup>
		<thead>
			<tr>
				<th align="center" colspan="2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품정보</th>
				<th>판매가격</th>
				<th>수량</th>
				<th>주문금액</th>
			</tr>
			
		</thead>
		<tbody>

<c:forEach var="data"  items="${list}" varStatus="i">
  			<tr>
								<td>
					<a href="<c:url value='/item/detail?p_num=${data.num }'/>"><img src="<c:url value='/resources/itemimage/${data.url }'/>"   style="width:90px;height:90px;"></a>
					<input type="hidden" name="p_num" value="${data.num }">
								</td>
								<td>
								
								<a href="<c:url value='/item/detail?p_num=${data.num }'/>">&nbsp;&nbsp;&nbsp;<span style="font-weight:bold;">${data.title}</span> </a>
								<input type="hidden" name="title" value="${data.title}">
								</td>
								<td>
																<div><span class="price1"><fmt:formatNumber value="${data.price}" pattern="#,###.##"/>원</span></div>
														
								</td>
								<td>
								
								<div >
										<span class="cnt">${data.cnt }개</span>
										<input type="hidden" name="cnt" value="${data.cnt }">
									</div>
								</td>
								<td><input class="price" type="text" name="price" style="border:none" readonly="readonly"></td>
					
							</tr>
  		
</c:forEach>


										
							
		</tbody>
	</table>
	<hr style="width:100%; height:5px; background-color:gray">
<!--  -->

<div class="section">
	<div class="tit">

	
		<img src="<c:url value='/resources/itemimage/order_step_02.png'/>">
	</div>

		<div class="tit">받으시는 분</div>
			<div class="content"><input name="name" type="text" ></div>
					

		<div class="tit">연락처</div>
			<div class="content"><input name="caddr1" type="text" > - <input name="caddr2" type="text" class="input_info"> - <input name="caddr3" type="text" class="input_info"></div>
	


<!-- 주소 입력  -->
<div>
<div class="tit">배송주소</div>
<input style="width:100px;" type="text" id="sample6_postcode" placeholder="우편번호" class="content">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>
<input style="width: 350px; margin-top:4px;"type="text"  name="juso1" id="sample6_address" placeholder="주소" class="content">
<input style="width:200px; "type="text"  name="juso2" id="sample6_address2" placeholder="상세주소" class="content">

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

</div>


<br>
<hr style="width:100%; height:5px; background-color:gray">

<!-- 결제정보 -->
	<div class="tit"> <img src="<c:url value='/resources/itemimage/order_step_03.png'/>"></div>
	

		<div class="left" >
			<!-- 결제수단 선택 -->
			<div class="content_wrap">
				<div class="tit"><img src="<c:url value='/resources/itemimage/order_pay_t2.png'/>"></div>
	
					<div class="paypay"><label style="margin-left:30px;"><input type="radio" name="pay_method"  value="card" checked=""> 신용카드</label></div>
					<div class="paypay"><label style="margin-left:30px;"><input type="radio" name="pay_method" value="bank"> 무통장d입금</label></div>

			</div>
		</div>

		<!-- 최종결제금액 -->

			<div>
			
			<div class="tit"><img src="<c:url value='/resources/itemimage/order_pay_t3.png'/>"></div>
				<div class="content2" style="padding:5px;">
						<table class="table table-bordered" style="width: 200px; margin-left:30px;">
	
						
						<tr>
						<td>총구매금액<span id="totalpay"></span>
						</td>
						</tr>	
						
						<tr>		
						<td>배송비
						<span id="delivery"></span>
						</td>
						</tr>
						
						<tr>
						<td>최종 결제 금액
						<span id="finalpay" ></span>
						</td>
						</tr>
				</table>
				</div>
			</div>
			
			<div style="margin-left:400px;">
				<a href="javascript:pay()"><img src="<c:url value='/resources/itemimage/paypay.JPG'/>"></a>
			</div>
	

	
</div>





<!--  -->
	<hr style="width: 100%; height:8px; background-color: pink;">
	<input type="hidden" value="${sessionScope.login }"name="m_email">
</form>
</div>