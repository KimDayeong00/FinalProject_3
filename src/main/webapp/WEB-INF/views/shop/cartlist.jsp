<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

abcd
<c:forEach items="${sessionScope.cartlist}" var="data" >
  				${data.title}
</c:forEach>



 