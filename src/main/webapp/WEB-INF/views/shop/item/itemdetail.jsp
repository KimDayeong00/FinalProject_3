<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="container">
	<div id="iteminfo">
	
		<div id="imgbox" >
		   <img style="width:470px; height: 470px;" id="img" src="<c:url value='/resources/itemimage/${iteminfo.item_savefilename }'/>">
		 </div>
		 
		 <div id="infobox">
		 	<form name="info" action="" method="post">
		 	<input type="hidden"  name=""  value="">
		 	<input type="hidden"  name=""  value="">
		 	<input type="hidden"  name=""  value="">
		 	<input type="hidden"  name=""  value="">
		 	<fieldset>
                    <legend class="screen-out">상품 상세 구매</legend>
                    <div class="mask"></div>
                    <div class="hd">
                        <h2 class="tit-shop-view">네츄럴코어 홀리스틱 베네 M32 멀티프로테인 7.2kg<span class="add-goods-name"></span></h2>
												<p class="product_by"><span>by</span><span><a href="/shop/goods/goods_list.php?category=&amp;search_word=&amp;search_by_brand%5B%5D=31">네츄럴코어</a></span></p>
						                        <div class="star">
                            <span class="ic-star" style="margin-top: 1px;">
                                <!-- 별점 width 값 입력 -->
                                <em style="width:90%">90점</em>
                            </span>
                                                        <em class="review-lnk"><a href="/shop/goods/goods_post.php?goodsno=23333"><em class="en">6,190</em>명 구매후기</a><span class="bar">|</span><a href="/shop/goods/goods_qna_list.php?goodsno=23333"><em class="en">76</em>개 질문/답변</a></em>
                        </div>
                    </div>
                    <div class="cont">
				
											<div class="price_info">
					
                                                                        <table>
                            <caption>제품정보</caption>
                            <colgroup>
                                <col>
                                <col>
                            </colgroup>
                            <tbody>

                                                <tr>
                    <th scope="row"><span>정가:</span></th>
                    <td><del><span class="consumer">46,000</span><span class="won">원</span></del></td>
                </tr>                       
                                						<tr>
							<th>판매가:</th>
							<td class="price_view"><span class="salling-price opt_price red">38,000<span class="red">원</span></span></td>
						</tr>                       
                                                <tr class="price discount" style="display:none;">
                    <th>할인가:</th>
                    <td><span class="opt_price red" style="display: inline-block;"></span><span class="discount-price red" style="display: inline-block;">0<span class="red">원</span></span> <span class="red" id="apopprice" style="display: inline-block;"></span></td>
                </tr>
                                            <tr class="price discounted">
                <th>할인받은금액:</th>
                    <td><span class="red"><span class="discounted-price">8,000</span><span class="red won">원</span> (<span class="discount-rate">17</span>%)</span></td>
            </tr>

                            </tbody>
                        </table>                        
											</div>
					
                        <div class="stock">
                            <dl>
                                <dt class="stock-state-text">
                                    재고있음                                </dt>
                                <dd>
                                    									<!--
									<a href="#" role="button" data-toggle="dropdown" class="bl-down-c">자세히 보기</a>
									<div class="ly-bubble dropdown-menu ly-read" role="menu">
										<strong>업체배송 상품 구매시 읽어보세요.</strong>
										<ul>
											<li class="bl-list">본 상품은 공급업체에서 배송하는 업체배송 상품입니다.</li>
											<li class="bl-list">강아지대통령 빠른배송과 달리 업체배송의 배송기간은 1~3일 더<br>소요될 수 있습니다.</li>
											<li class="bl-list">주문제작의 경우 제작기간만큼 배송기간이 늘어 날 수 있습니다.</li>
											<li class="bl-list">주문한 상품 중 일부만 받으신 경우 업체배송상품이 포함되어 있는지<br>주문내역을 꼭 확인바랍니다.</li>
											<li class="bl-list">교환/반품은 상품 받은 날로부터 7일 이내에 신청해 주셔야 합니다. </li>
										</ul>
									</div>
									-->
									강아지대통령 빠른배송 상품입니다.
                                </dd>
                                                                <dd class="delivery-time">
                                                                        <span id="remain_time"><em><strong>4시간 15분</strong></em> 이내에 주문하시면 <strong>4월 30일(월)</strong><strong> 발송</strong> 예정</span>
                                </dd>

                            </dl>
                        </div>
                        <div class="option" style="padding-top:0;margin-bottom:0px;margin-top: -7px;">
                            <dl>
                                							
								
															</dl>
                        </div>


                        
                        

                        <div class="option" style="padding-top:0;margin-bottom:0px;margin-top: -6px;">
                            <dl>
                                                                <dt class="quantity-area" style="height:18px;">수량:</dt>
                                <dd class="sel-box quantity-area" style="">
                                    <label class="screen-out">선택</label>
                                    <select name="quantity" class="select-sort en" style="margin-bottom: 1px;">
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




                                                <ul class="prdc" style="margin-top: 4px;">
                                                                                    <li>아스타크산틴 오리고기 함유로 면역력 강화에 도움</li>
                                                                                    <li>소화기능 개선 및 설사예방, 변냄새 개선</li>
                                                                                    <li>치아가 약해도 쉽게 씹어먹을 수 있는 낮은 알갱이 밀도</li>
                                                                                    <li>항생제, 화학비료, 합성착색료, GMO 무첨가</li>
                                                                                                                                                                                                                            </ul>
                                           
                        <div class="goods-view-gift" style="padding-top:14px;">
							<!-- 2017-10-31 : 프로세스변경 -->
                            <p>3만원 이상 구매하시면 스티커를 적립해 드립니다.<a href="/shop/order/order_gift_info.php"><span class="goods-view-link">스티커 적립보기</span></a></p>
							<!-- 2017-10-31 : 프로세스변경 -->
                        </div>
                        
                    </div>
                    <div class="btn-order">
                                                <a href="#" class="btn-yellow btn-big add-cart" onmousedown="javascript:AEC_F_D('23333','i','1'); csf('event','1'); fbq('track', 'AddToCart',{content_ids:['23333'],content_type:'product'}); sh.sendCart();">장바구니 담기</a>
                                                <a href="#" class="btn-gray btn-big add-wishlist" data-sticker="" onmousedown="javascript:sh.sendWish();">관심상품 추가</a>
                        <p class="not-allowed-txt dis-a1 error-message" style="display: none;">상품 옵션을 선택해주세요.</p>
                        <!-- 장바구니 담기 -->
                        <div class="ly-tp-a cart-message" style="display: none;">
                            <p class="p-msg">선택하신 상품을 장바구니에 담았습니다.</p>
                            <div class="foot"><button type="button" class="btn-yellow btn-cart-move"><span>장바구니 보기</span></button><button type="button" class="btn-gray btn-continue"><span>닫기</span></button></div>
                            <button type="button" class="pop_close btn-continue">창 닫기</button><!-- 2016-07-18 : 신규추가 -->
                        </div>
                        <!--// 장바구니 담기 -->
                        <!-- 관심상품 추가 -->
                        <div class="ly-tp-b wishlist-message" style="display: none;">
                            <p class="p-msg">관심상품으로 추가하였습니다.</p>
                            <div class="foot"><button type="button" class="btn-yellow btn-wishlist-move"><span>관심상품 보기</span></button><button type="button" class="btn-gray btn-continue"><span>닫기</span></button></div>
                            <button type="button" class="pop_close btn-continue">창 닫기</button><!-- 2016-07-18 : 신규추가 -->
                        </div>
                        <!--// 관심상품 추가 -->
                    </div>
                </fieldset>
		 	${iteminfo. item_name}
		   판매가 : ${iteminfo.price }
		   	<input type="text" name="stock">
		   	</form>
		 </div>
		 
	</div>
</div>