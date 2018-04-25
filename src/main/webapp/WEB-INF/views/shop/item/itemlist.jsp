<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover"  >

    <tr>
        <td>분류</td>
               <c:forEach var="fieldvo" items="${fieldvo}">
			 <td><a href="<c:url value='/item/itemlist?fieldnum=${fieldvo.fieldnum }&classnum=${fieldvo.classnum }'/>">${fieldvo.name }</a></td>
 	 	</c:forEach>    
    </tr>
    
    
    <c:forEach var="filtertypevo" items="${filtertypevo }">
    <tr>
    	<td>${filtertypevo.ft_name }</td><td>abc</td>
    </tr>
    </c:forEach>
    
    
    <tr>
        <td>나</td>
         <c:forEach var="itemvo" items="${itemvo}">
			 <td><a href="<c:url value='/item/itemlist?fieldnum=${itemvo.fieldnum }'/>">${itemvo.item_name }</a></td>
 	 	</c:forEach>    
    </tr>
    
    </table>