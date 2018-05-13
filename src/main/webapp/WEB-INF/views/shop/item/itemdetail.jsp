<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
window.onload=function(){
	$("#sum").text(Comma(${iteminfo.price}));
	$("#price").text(Comma(${iteminfo.price})+"원");
}
$(function(){
	$("#cnt").change(function(){
	
		var cnt=this.value;
		var price=${iteminfo.price};
		var com=cnt * price;
		var sum=Comma(com);
		$("#sum").text(sum);
	});
	

	$("#imglist ul li").hover(function(){
		
		$(this).css('border','1px solid red');

		$("#imgbox img").attr("src",$(this).find("img").attr("src"));
		
	},function(){
	
		$("#imgbox img").attr("src","<c:url value='/resources/itemimage/${iteminfo.image_name}'/>");
		$(this).css('border','1px solid #d3d3d3')
	
	});

});

function Comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function cart(){

	form=document.getElementById("info");
	form.action="<c:url value='/shop/cart'/>";
	form.submit();
}

function buy(){
	form=document.getElementById("info");
	form.action="<c:url value='/shop/buy'/>";
	form.submit();
}

</script>
<div class="container" style="margin:auto;">
	<div id="iteminfo">
		<div id="imglist" style="float:left; margin-right: 25px;">
		<ul>
				<c:forEach var="imglist" items="${imglist }">
				 <li style="margin-bottom:10px; border: 1px solid #d3d3d3;width:40px; height:40px;"><a href="#" ><img src="<c:url value='/resources/itemimage/${imglist.item_savefilename }'/>" width="40" height="40" ></a></li>
               
				</c:forEach>
    </ul>
         </div>
            			        
            			        
		<div id="imgbox"  style="float: left; margin-right: 25px;">
			<img style="width: 470px; height: 470px;" id="img"
				src="<c:url value='/resources/itemimage/${iteminfo.image_name }'/>">
		</div>

		<div id="infobox"  style="padding-left: 100px;" >
			<form name="info" method="post" id="info">
				<input type="hidden" name="num" value="${iteminfo.p_num }">
				<input type="hidden" name="title" value="${iteminfo.item_name }"> 
				<input type="hidden" name="price" value="${iteminfo.price }"> 
				<input type="hidden" name="url" value="${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}">

				<fieldset>

					<div class="hd">
						<h2>${iteminfo.item_name }</h2>
						<div class="star">
							<span class="ic-star" style="margin-top: 1px;"> <!-- 별점 width 값 입력 -->
								<em style="width: 90%">90점</em>
							</span>
						</div>
					</div>
					<div class="cont">

						<div class="price_info">

							<table>
								<tbody>
									<tr>
										<th>판매가:</th>
										<td><span id="price"><span>원</span></span></td>
									</tr>
										<tr>
											<th>재고있음</th>
										</tr>
								</tbody>
								
							</table>
						</div>
						
			
						<div>
							<dl>
								<dt >수량:</dt>
									<dd>
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
							</dd>
							</dl>
						</div>
						
						<div>
							<dl>
							<dt>총상품금액: <span style="color: red; font-size: 23px;" id="sum"> ${iteminfo.price }</span><span style="color:red; font-size: 18px;">원</span></dt>
							<dt></dt>
							</dl>
						</div>


					</div>
					
					<div>
					
							<a href="javascript:buy()"><button type="button" class="btn btn-info">바로 구매하기</button></a>
						 <a href="javascript:cart()"><button type="button" class="btn btn-info">장바구니 담기</button></a>
				
				
					
					</div>
				</fieldset>
	
			</form>
		</div>

	</div>
</div>

<div style="width: 1200px; right: 800px; margin: auto; clear: both;" >
	<div>
	<hr>
	<h2> 상세 정보</h2>
	${iteminfo.content }
	</div>
	
	<div>
	
	<hr>
<h2>구매후기</h2>
가나다라마바
	</div>
	
</div>

