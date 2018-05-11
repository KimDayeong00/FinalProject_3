<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- header-section close -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 1700px; margin: auto;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<c:url value='/resources/images/11.JPG'/>" style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>

    <div class="item">
      <img src="<c:url value='/resources/images/12.JPG'/>"style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>
    <div class="item">
      <img src="<c:url value='/resources/images/13.JPG'/>"style="width:100%">
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
    <!-- service-section start -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="service-img">
                        	<c:forEach var="vo" items="${list }">
								${vo.content }
							</c:forEach>
                        </div>
               </div>
            </div>
         </div>
     </div>
