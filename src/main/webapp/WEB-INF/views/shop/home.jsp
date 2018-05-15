<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
  <style>
  #item{word-wrap:break-word; width:250px;}
  .gallery {
    padding: 24px 10px;
}
.gallery {
    padding: 85px 0 73px;
}
.gallery td{margin-left: 50px; width:400px;}
  .gallery {
  border-spacing: 1px;
  border-collapse: separate;
}
  </style>

  
  
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<c:url value='/resources/images/1.jpg'/>" style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>

    <div class="item">
      <img src="<c:url value='/resources/images/2.jpg'/>"style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>

  

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<br>
<br>
<br>
<div id="hotitem" style="margin-left: 320px;">
<h3 style="color: #d07826;"><span>판매량이 많은 상품입니다.</span></h3>
<hr style="width:75%; height:2px; background-color:gray;margin-right:400px;">

<c:set var="i" value="0" />
<c:set var="j" value="5" />

<table >

       <c:forEach var="hotitem" items="${hotitem}">
            <c:if test="${i%j == 0 }">
               <tr>
            </c:if>
                    <td style="size: 250px;" id="item">
                <a id="${hotitem.p_num }" href="<c:url value='/item/detail?p_num=${hotitem.p_num }'/>">   <img style="width: 170px; height:170px;" src="<c:url value='/resources/itemimage/${hotitem.image_name }'/>"> <br><font color="#004B91" >${hotitem.item_name }</font></a><br>
               <span style="font-weight: bold;color: #b12603;"> <fmt:formatNumber value="${hotitem.price}" pattern="#,###.##"/>원</span>
			</td>
            <c:if test="${i%j == j-1 }">
                </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
        </c:forEach>

 

</table>

</div>

<div id="newitem" style="margin-left: 320px;">
<c:set var="i" value="0" />
<c:set var="j" value="5" />
<br>
<br>

<h3 style="color: #d07826;"><span>새로 들어온 상품입니다.</span></h3>
<hr style="width:75%; height:2px; background-color:gray;margin-right:400px;">
<table >

       <c:forEach var="newitem" items="${newitem}">
            <c:if test="${i%j == 0 }">
               <tr>
            </c:if>
                    <td style="size: 250px;" id="item">
                <a id="${newitem.p_num }" href="<c:url value='/item/detail?p_num=${newitem.p_num }'/>">   <img style="width: 170px; height:170px;" src="<c:url value='/resources/itemimage/${newitem.image_name }'/>"> <br><font color="#004B91" >${newitem.item_name }</font></a><br>
               <span style="font-weight: bold;color: #b12603;"> <fmt:formatNumber value="${newitem.price}" pattern="#,###.##"/>원</span>
			</td>
            <c:if test="${i%j == j-1 }">
                </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
        </c:forEach>

 

</table>

</div>
<br><br><br>

<section class="gallery" >
<table style="margin-left:56px;">
		
			<tr id="instaPics" class="gallery">
			<td><a href="<c:url value='/booking/list'/>" title="BookingList"><img src="https://scontent.cdninstagram.com/vp/0408bb9fa375ae3ad932867403d546db/5AFAEFDF/t51.2885-15/s320x320/e15/28428996_193613691371241_8340335853242941440_n.jpg" style="width:300px; height:300px"></a></td>
			<td><a href="<c:url value='/booking/list'/>" title="BookingList"><img src="https://scontent.cdninstagram.com/vp/280e3f23da850e24345634a1fdcf2d49/5B7A01C7/t51.2885-15/s320x320/e35/28152059_1763356080370796_1558636772655628288_n.jpg" style="width:300px; height:300px"></a></td>
			<td><a href="<c:url value='/booking/list'/>" title="BookingList"><img src="https://scontent.cdninstagram.com/vp/09dd9616910364031507c34b1c8e5e67/5B761480/t51.2885-15/s320x320/e35/27581110_352404525227343_992106160834215936_n.jpg" style="width:300px; height:300px"></a></td>
			<td><a href="<c:url value='/booking/list'/>" title="BookingList"><img src="https://scontent.cdninstagram.com/vp/30765e51162105d41c411753b08d63cd/5B920E6D/t51.2885-15/s320x320/e35/27577183_1663069520418306_789274483444678656_n.jpg" style="width:300px; height:300px"></a></td>
			<td><a href="<c:url value='/booking/list'/>" title="BookingList"><img src="https://scontent.cdninstagram.com/vp/b8fa4e49a923e3f938ec595a8664e759/5B96B01A/t51.2885-15/s320x320/e35/26867768_818737968334386_9036629371380563968_n.jpg" style="width:300px; height:300px"></a></td>
		</table>
		</section>

