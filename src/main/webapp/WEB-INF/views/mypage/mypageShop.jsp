<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="sitterPageContent">
	<div class="petsitterPageMenu">
		<div class="sitterImg">
			<img>
		</div>
		<div class="reservationList">
			<span><a href="<c:url value='/mypage?page=top&dtld=reservation'/>">예약 관리</a></span>
		</div>	
		<div class="petsitterInfoManage">
			<span><a href="<c:url value='/mypageShop'/>">구매 관리</a></span>
		</div>
		<div class="petInfoManage">
			<span><a href="<c:url value='/myPetInfo?page=petInfo&dtld=petList'/>">반려견 정보 관리</a></span>
		</div>
		<div class="accountManage">
			<span><a href="<c:url value='/my_account?page=account&dtld=accountUpdate'/>">계정 정보 수정</a></span>
		</div>
	</div>
	
	<div class='mypetsitterContent' style="border: 3px solid gray">
		<div class='mypageMenubar'>
			<div class="menubarDiv2" style="height: 50px;"><h2 style="margin-top: 8px;"><a href="<c:url value='mypageShop'/>">구매 내역</a></h2></div>
		
		</div>
		
		
	<div style="margin-top: 30px; padding-top: 30px;"></div>
	<c:forEach var="orderlist" items="${orderlist }">
      <div id="listContainer" class="my-purchase-list" style="margin-top:3px; padding-top: 3px;">
		<div style="margin-top: 3px; padding-top: 3px;">
		
      <h4 style="color: #d07826;padding-top:10px;margin-left: 200px;">구매번호 : 1805${orderlist.buy_num }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문일 : <fmt:formatDate pattern = "yyyy-MM-dd"  value = "${orderlist.buy_date }" /></h4>
     
    	
    	
    	
      </div>
    <table>
      <colgroup>
        <col  width="150">
        <col width="400">
		<col width="150">
      </colgroup>
  
  <c:forEach var="list" items="${orderlist.list }">
      <tr style='height:13px; cursor:hand;'>
        <td> 
                   <a href="<c:url value='/item/detail?p_num=${list.p_num }'/>">
                     <img src="<c:url value='/resources/itemimage/${list.image_name }'/>" style="width:100px; height: 100px;">
                    </a>
        </td>

        <td>
        <a href="<c:url value='/item/detail?p_num=${list.p_num }'/>"> <strong>${list.item_name }</strong></a>
         <br>
                      ${list.price } / ${list.amount }개
        </td>
                      
        <td>
                <div style="margin:2px;">
                  <a href="#" ><img style="width:100px; height:22px; "src="<c:url value='/resources/itemimage/deli.JPG'/>"></a>
                </div>
      
                   <div style="margin:2px;">
                  <a href="#" ><img style="width:100px; height:22px; "src="<c:url value='/resources/itemimage/exchange.JPG'/>"></a>
                </div>
                        
     
                    <div style="margin:2px;">
                  <a href="#" ><img style="width:100px; height:22px; "src="<c:url value='/resources/itemimage/banpum.JPG'/>"></a>
                </div>
  
                <div style="margin:2px;">
                  <a href="#" ><img style="width:100px; height:22px; "src="<c:url value='/resources/itemimage/write.JPG'/>"></a>
                </div>
    
        </td>
      </tr>
        </c:forEach>
     
    </table>
    <br>
    <br>
            </div>
            </c:forEach>
        
          </div>
</div>
