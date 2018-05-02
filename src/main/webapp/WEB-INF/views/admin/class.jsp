<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%-- <title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>

<script type="text/JavaScript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.sticky/1.0.4/jquery.sticky.js"></script> --%>
<script type="text/javascript">
	$(document).ready(function(){
		/* 대분류 리스트 */
		//var name = $("#name").val();
		$.ajax({
			url : "<c:url value = '/admin/classList'/>",
			dataType : "json",
			success : function(data){
				var str = "<tr>";
				for(var i=0;i<data.length;i++){
					var classnum = data[i].classnum;
					var name = data[i].name;
					str += "<td>" + classnum + "</td><td id='"+classnum+"'><a href='javascript:fieldInfo(" + classnum + ")'>" + name + "</a></td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					str += "</tr>";
				}
				//console.log(classnum);
				$("#classListBody").append(str);
			}
		});
		
		/* 대분류 추가 */
		$("#classInsert").click(function(){
			//alert("ok?");
			var name = $("#name").val();
			$.ajax({
				url : "<c:url value = '/admin/classInsert/" + name + "'/>",
				dataType : "json",
				success : function(data){
					var classnum = data.classnum;
					var name = data.name;
					//console.log(name);
					console.log(data);
					//var td = document.createElement("td");
					/* var str = "<tr><td>" + classnum + "</td><td>" + name + "</td></tr>";
					$("classList").append(str); */
					var str = "<td>" + classnum + "</td><td id='"+classnum+"'><a href='javascript:fieldInfo(" + classnum + ")'>" + name + "</td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					$("#classListBody").append(str);
				}
			});
		});
		
		/* 중분류 리스트 */
		$.ajax({
			url : "<c:url value = '/admin/fieldList'/>",
			dataType : "json",
			success : function(data){
				console.log(data);
				for(var i=0;i<data.length;i++){
					var fieldnum = data[i].fieldnum;
					var name = data[i].name_1;
					var str = "<tr>";
					str += "<td>" + fieldnum + "</td><td>" + name + "</td><td>삭제</td><td>수정</td>";
					str += "</tr>";
				$("#fieldListBody").append(str);
				}
				//console.log(classnum);
			}
		});
	});
	
	/* 대분류 업데이트 */
	function classUpdate(classnum){
		var name = $("#" + classnum + "").text();
		$("#" + classnum + "").html("<input type='text' id = 'name"+classnum+"' value='" + name + "'><input type='button' id='classUpdateOk' value='수정'  onclick = 'classUpdateOk("+classnum+")'>");
	}
	function classUpdateOk(classnum){
		var name = $("#name" + classnum + "").val();
		$.ajax({
			url : "<c:url value = '/admin/classUpdateOk'/>",
			data : {classnum : classnum, name : name},
			dataType : "json",
			success : function(data){
				$("#classListBody").html("");
				//console.log(data);
				for(var i=0;i<data.length;i++){
				var str = "<tr>";
					var classnum = data[i].classnum;
					var name = data[i].name;
					str += "<td>" + classnum + "</td><td id='"+classnum+"'><a href='javascript:fieldInfo(" + classnum + ")'>" + name + "</td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					str += "</tr>";
				$("#classListBody").append(str);
				}
			}, error : function(){
				alert("업데이트 에러");
			}
		});
	}
	/* 대분류 삭제 */
	function classDelete(classnum){
		//console.log(classnum);
		$.ajax({
			url : "<c:url value = '/admin/classDelete'/>",
			data : {classnum : classnum},
			dataType : "json",
			success : function(data){
				$("#classListBody").html("");
				//console.log(data);
				for(var i=0;i<data.length;i++){
					var str = "<tr>";
					var classnum = data[i].classnum;
					var name = data[i].name;
					str += "<td>" + classnum + "</td><td id='"+classnum+"'><a href='javascript:fieldInfo(" + classnum + ")'>" + name + "</td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					str += "</tr>";
				$("#classListBody").append(str);
				}
			}, error : function(){
				alert("삭제 에러");
			}
		});
	};
	
	
	/* 중분류 인포 */
	function fieldInfo(classnum){
		console.log(classnum);
		$.ajax({
			url : "<c:url value = '/admin/fieldInfo'/>",
			data : {classnum : classnum},
			dataType : "json",
			success : function(data){
				console.log(data);
				$("#fieldListBody").html("");
				for(var i = 0;i<data.length;i++){
					var str = "<tr>";
					var fieldnum = data[i].fieldnum;
					var name = data[i].name_1;
					str += "<td>" + fieldnum + "</td><td>" + name + "</td><td>삭제</td><td>수정</td>";
					str += "</tr>";
					$("#fieldListBody").append(str);
				}
			}
		});
	};
</script>
</head>
<body>
	<h2>대분류(Class)</h2>
		<table border = "1" width = "500" id = "classList">
			<tr>
				<th>Class_Num</th>
				<th>NAME</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<tbody id="classListBody">
			</tbody>
		</table>
		<br>
		<form action = "" method = "post">
			대분류 이름<input type = "text" id = "name">
			<input type = "button" id = "classInsert" value = "추가">
		</form>
		<br>
		<br>
		
	<h2>중분류(Field)</h2>	
		<table border = "1" width = "500" id = "fieldList">
			<tr>
				<th>Field_Num</th>
				<th>NAME</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<tbody id="fieldListBody">
			</tbody>
		</table>
		<br>
		<form action = "" method = "post">
			중분류 이름<input type = "text" id = "fieldname">
			<input type = "button" id = "fieldInsert" value = "추가">
		</form>
</body>
</html>