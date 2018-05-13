<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



  <nav class="navbar navbar-reverse">
  <div class="container-fluid">
       <!-- Collect the nav links, forms, and other content for toggling -->

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">카테고리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <c:forEach var="classvo" items="${classvo}">
          <li><a href="<c:url value='/item/classitemlist?classnum=${classvo.classnum }'/>">${classvo.name }</a></li>
        </c:forEach>    
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<script>
/* $(function(){
	$("button").removeClass("btn");
	$("button").removeClass("btn-default");
	$("button").addClass("btn");
	$("button").css("background-color","green");
	
}) */
</script>


  
   --%>