<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <style>

  </style>
<script>
window.onload=getTotal;

function chkchk(){
	if($('input[name=chk]').prop("checked")){
		buy();
	}else{
		if($('input[name=chk]').prop("checked")){
			buy();
		}
		alert("구매하실 상품을 선택해주세요.");
	}





}
function buy(){
	form=document.getElementById("cart");
	form.action="<c:url value='/shop/buy'/>";
	form.submit();
}
	
function getTotal(){
	var sum=0;
		$(".price2").each(function(){
			var text=parseInt(removeComma($(this).text()));
			sum+=text;
			
		});
		$("#gettot").text(Comma(sum)+"원");
		
	if(sum<50000){
		$("#delivery").text(Comma(3000)+"원");
		$("#pay").text(Comma(sum+3000)+"원");
	}else{
	
		$("#delivery").text("0원");
		$("#pay").text(Comma(sum)+"원");
	}
	}
$(function(){

	$(".chk").on("click",function(){
		if ($('.chk').is(":checked")) {
		    $('input[name=sampleHidden]').val('Y');
		} else {
		    $('input[name=sampleHidden]').val('N');
		}
	})

		<c:forEach items="${sessionScope.cartlist}" var="data" begin="1" varStatus="a">
		//	${data.hash }	
	//		$("#"+${data.hash }).selected();
	var select=document.getElementById("${data.hash }");
	select.options[${data.cnt-1}].selected=true;
		</c:forEach>

});

	
	function Comma(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function removeComma(n) {
	      var txtNumber = '' + n;
	      return txtNumber.replace(/(,)/g, "");
	   }
	
function change(price,cnt,hash){

	var name=document.getElementById(hash+"abc");
	var val=price * cnt;
	var price=Comma(val);
	name.innerHTML=price+"원";
	
	getTotal();
	
}


function checkAll(){
		var check=document.getElementsByName("chk");
		var checkAll=document.getElementById("chkall");
		if(checkAll.checked==true){
			for(var i=0; i<check.length;i++){
			    check[i].checked=true;
			}
		}else{
		    for(var i=0; i<check.length;i++){
			    check[i].checked=false;
			}
		}
	}
</script>

<div>
<img src="<c:url value='/resources/itemimage/cart_t.png'/>">
</div>
<div style="width:100%; background-color: green; height: 8px;">
</div>

<form id="cart" method="post">
<table>
		<colgroup>
			<col width="40">
			<col width="90">
			<col width="354">
			<col width="125">
			<col width="90">
			<col width="130">
			<col width="125">
			<col width="40">
		</colgroup>
		<thead>
			<tr>
				<th><label><input type="checkbox" id="chkall" onclick="checkAll()"></label></th>
				<th align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품정보</th>
				<th>판매가격</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>

							
<c:forEach items="${sessionScope.cartlist}" var="data" begin="0" varStatus="a" >
	
  			<tr>
								<td>
							
								<input type="checkbox"  class="chk" name="chk"  id="${data.num}" value="${a.index }">
								<input type="hidden" name="num" value="${data.num}">
								
								</td>

								<td>
					<a href="product.html?pd_code=G010620"><img src="<c:url value='/resources/itemimage/${data.img }'/>" width="90" height="90"></a>
					<input type="hidden" name="img" value="${data.img }">
									</td>
								<td>
								<a href="${data.url }">${data.title} </a>
								<input type="hidden" name="title" value="${data.title}">

								</td>
								<td>
																<div><span class="price"><fmt:formatNumber value="${data.price}" pattern="#,###.##"/>원</span></div>
																<input type="hidden" name="price" value="${data.price}">
								</td>
								<td>
									<div >
										 <select name="cnt" id="${data.hash }"  onchange="change(${data.price },this.value,${data.hash })">
								
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
									</select>
									</div>
								</td>
								<td><span class="price2" id="${data.hash}abc"><fmt:formatNumber  value="${data.val}" pattern="#,###.##"/>원</span></td>
								<td><a href="<c:url value='/shop/del?hash=${data.hash }'/>">삭제</a></td>
								
  			
							</tr>
  			
</c:forEach>


										
							
		</tbody>
	</table>
	<input type="hidden" value="${sessionScope.login }"name="id">
	<hr style="width:100%; height:5px; background-color:gray">
	<img src="<c:url value='/resources/itemimage/cart_total_tit.png'/>">
	<br>
	<!-- 주문합계 -->
	<div >
	
	<div class="price" style="float: left;"><!-- 상품금액 -->
	<img src="<c:url value='/resources/itemimage/cart_total_01.png'/>">
			<br><div id="gettot"></div>
		</div>
		
		<div class="sign" style="float: left;">
		<img src="<c:url value='/resources/itemimage/cart_total_plus.png'/>">
		
		</div>
		
		<div class="price" style="float: left;"><!-- 배송비 -->
			<img src="<c:url value='/resources/itemimage/cart_total_02.png'/>">
			<br><div id="delivery"></div>
		</div>
		
		<div class="sign" style="float: left;">
		<img src="<c:url value='/resources/itemimage/cart_total_equal.png'/>">
		</div>
		
		<div class="price total" style="float: left;"><!-- 결제예상금액 -->
		<img src="<c:url value='/resources/itemimage/cart_total_06.png'/>">
			<br><div id="pay"></div>
		</div>
		
		</div>
		
	<hr style="width: 100%; height:8px; background-color: pink;">
</form>

<div class="mid" style="margin-top:10px; margin:auto;">
	<div style="display:inline-block; padding-left: 10px;  padding-bottom: 35px;margin-left: 800px; "><a href="javascript:chkchk();"><img src="<c:url value='/resources/itemimage/cart_btn_01_m.jpg'/>"></a></div>
	</div>


 