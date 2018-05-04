<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
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

<form>
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

<c:forEach items="${sessionScope.cartlist}" var="data" >
	
  			<tr>
								<td><input type="checkbox" name="chk"  id="${data.num}" value="${data.num }"></td>
								<td>
					<a href="product.html?pd_code=G010620"><img src="<c:url value='/resources/itemimage/${data.img }'/>" width="90" height="90"></a>
									</td>
								<td>
								<a href="product.html?pd_code=G010620">${data.title} </a>

								</td>
								<td>
																<div >${data.price} </div>
								</td>
								<td>
									<div >
										 <select name="cnt" id="cnt" >
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
								<td>${data.price }</td>
								<td><a href="<c:url value='/shop/del?num=${data.num }'/>">삭제</a></td>
								
  			
							</tr>
  			
</c:forEach>


										
							
		</tbody>
	</table>
	<hr style="width:100%; height:5px; background-color:gray">
	<img src="<c:url value='/resources/itemimage/cart_total_tit.png'/>">
	
	<!-- 주문합계 -->
	<div >
	
	<div class="price" style="float: left;"><!-- 상품금액 -->
	<img src="<c:url value='/resources/itemimage/cart_total_01.png'/>">
			<br>32,940원
		</div>
		
		<div class="sign" style="float: left;">
		<img src="<c:url value='/resources/itemimage/cart_total_plus.png'/>">
		
		</div>
		
		<div class="price" style="float: left;"><!-- 배송비 -->
			<img src="<c:url value='/resources/itemimage/cart_total_02.png'/>">
			<br>0원
		</div>
		
		<div class="sign" style="float: left;">
		<img src="<c:url value='/resources/itemimage/cart_total_equal.png'/>">
		</div>
		
		<div class="price total" style="float: left;"><!-- 결제예상금액 -->
		<img src="<c:url value='/resources/itemimage/cart_total_06.png'/>">
			<br>32,940원
		</div>
		
		</div>
	<hr style="width: 100%; height:8px; background-color: pink;">
</form>


 