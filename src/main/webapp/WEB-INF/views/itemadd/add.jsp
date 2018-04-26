<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script type="text/javascript">

function select(){
	var classsel = document.getElementById("classsel");
	var val = classsel.options[classsel.selectedIndex].value;
	alert(val);
	
		$.ajax({
 			url:"<c:url value='/itemadd/fieldlist?classnum="+val+"'/>",
 			dataType:"json",
 			success:function(data){
 				$("#fieldsel").empty();

 				for(var i=0;i<data.fieldvo.length;i++){
 					
 					 var option ="<option value="+data.fieldvo[i].fieldnum+">"+data.fieldvo[i].name+"</option>";
 				$("#fieldsel").append(option);
 				}
 		
 					
 					
 					
 				}		
 			});
	
}

function handleFileSelect() 
{
    var files = document.getElementById('file1').files[0]; //파일 객체

    var reader = new FileReader();

         
    reader.onload = (function(theFile) 
    {
        return function(e) 
        {
            var img_view = ['<img src=" ', e.target.result, ' " title=" ', escape(theFile.name), ' " style="width:210px;height:200px;"/>'].join('');                
            document.getElementById('list').innerHTML = img_view;
        };
    })(files);
    reader.readAsDataURL(files);    
}

</script>
<form method="post" action="<c:url value='/itemadd/insert'/>" enctype="multipart/form-data">
	<table class="table table-striped">

		<thead>
			<tr>
				<th colspan="2" align="center">상품등록하기</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>항목선택</td>
				<td>
					<select id="classsel" onchange="select()">
					<c:forEach var="classvo" items="${classvo }">
						<option value="${classvo.classnum }">${classvo.name }</option>
						</c:forEach>
					</select>
					
				
					<select id="fieldsel"  name="fieldnum"> 
					<option>선택하세요.</option>
					</select>
			
				</td>
			</tr>
			<tr>
				<td>상품이미지3</td>
				<td><input type="file" name="file1" id="file1" onchange="handleFileSelect()">
				<div id="list" style="size: 200px;"><img src=""  style="size:200px"></div>
				</td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="item_name"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>입고수량</td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td>상품등록</td>
				<td><input type="submit" value="상품등록"></td>
			</tr>
			
			

		</tbody>
	</table>
</form>

