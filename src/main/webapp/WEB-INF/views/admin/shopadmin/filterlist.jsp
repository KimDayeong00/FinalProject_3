<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

function select(){
	var classsel = document.getElementById("classsel");
	var val = classsel.options[classsel.selectedIndex].value;
		$.ajax({
 			url:"<c:url value='/shopadmin/filtercontent?ft_num="+val+"'/>",
 			dataType:"json",
 			success:function(data){
 				$("#classnum").html("필터내용");
 				for(var q=0; q<data.list.length; q++){
 			      	var fc_name = data.list[q].fc_name;
 			      	console.log(fc_name)
 			      	$("#classnum").append("<h4>"+fc_name+"</h4>")
 		    	}
 			}		
 		});
}
</script>
<form method="post" enctype="multipart/form-data" name="frm" onsubmit="return aaa()">
	<table class="table table-striped" style="float:left; margin-left:300px; width: 1000px;">

		<thead>
			<tr>
				<th colspan="2" align="center">필터관리하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="10">추가할 필터타입 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="filtertype" id="" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="필터타입추가" formaction="<c:url value='/shopadmin/filtertypeinsert'/>"/></td>
			</tr>
			<tr>
				<td colspan="10">추가할 필터내용&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="classsel" name="ft_num" onchange="select()">
						<option>필터타입을 선택하세요.</option>
					<c:forEach var="list" items="${list }">
						<option value="${list.ft_num }">${list.ft_name }</option>
						</c:forEach>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
				 <input type="text" name="filtercontent" id="" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="필터내용추가" formaction="<c:url value='/shopadmin/filtercontentinsert'/>"/></td>
			</tr>
			<tr>
				<td><div id="classnum">필터내용</div></td>
			</tr>
		</tbody>
	</table>
</form>
<!-- include libraries(jQuery, bootstrap) -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


