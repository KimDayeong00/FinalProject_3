<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="post"  enctype="multipart/form-data" name="frm" onsubmit="return aaa()">
	<table class="table table-striped" style="float:left; margin-left:300px; width: 1000px;">

		<thead>
			<tr>
				<th colspan="2" align="center">카테고리등록하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>대분류 추가
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="classname" id="" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					<input type="submit" value="대분류 등록" formaction="<c:url value='/shopadmin/kategorieclassinsert'/>">
				</td>	
				<!-- <select id="fieldsel" onchange="select1()" name="fieldnum"> 
					<option>선택하세요.</option>
					</select> -->
			</tr>
			<tr>
				<td>중분류 추가
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="classsel" name="classselect" onchange="select()">
						<option>선택하세요.</option>
					<c:forEach var="classvo" items="${classvo }">
						<option value="${classvo.classnum }">${classvo.name }</option>
						</c:forEach>
					</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="field" id="" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
				<input type="submit" value="중분류 등록" formaction="<c:url value='/shopadmin/kategoriefieldinsert'/>">
				</td>
			</tr>
			<tr>
				<td>선택한 대분류의 중분류 목록</td>
			</tr>
			<tr>
				<td><div id="classfield"></div></td>
			</tr>
		</tbody>
	</table>
</form>
<!-- include libraries(jQuery, bootstrap) -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script type="text/javascript">
function select(){
	var classsel = document.getElementById("classsel");
	var val = classsel.options[classsel.selectedIndex].value;
		$.ajax({
 			url:"<c:url value='/shopadmin/fieldlist?classnum="+val+"'/>",
 			dataType:"json",
 			success:function(data){
 				$("#classfield").empty();
 				for(var i=0;i<data.fieldvo.length;i++){
 					var option ="<td style='width:100px;'>"+data.fieldvo[i].name+"</td>";
 					$("#classfield").append(option);
 				}
 			}		
 		});
}
</script>