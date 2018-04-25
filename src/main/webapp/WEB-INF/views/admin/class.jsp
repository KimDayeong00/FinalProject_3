<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var name = $("#name").val();
		$.ajax({
			url : "<c:url value = '/admin/classList'/>",
			dataType : "json",
			success : function(data){
				var str = "<tr>";
				for(var i=0;i<data.length;i++){
					var classnum = data[i].classnum;
					var name = data[i].name;
					str += "<td>" + classnum + "</td><td id='"+classnum+"'><a href='javascript:filedList(" + classnum + ")'>" + name + "</a></td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					str += "</tr>";
				}
				//console.log(classnum);
				$("#classListBody").append(str);
			}
		});
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
					var str = "<td>" + classnum + "</td><td>" + name + "</td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					$("#classListBody").append(str);
				}
			});
		});
	});
	function classUpdate(classnum){
		var name = $("#" + classnum + "").text();
		$("#" + classnum + "").html("<input type='text' id = 'name"+classnum+"' value='" + name + "'><input type='button' id='classUpdateOk' value='수정'  onclick = 'classUpdateOk(\"name"+classnum+"\")'>");
	}
	function classUpdateOk(id){
		console.log($("#" + id + "").val());
		
	}
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
					str += "<td>" + classnum + "</td><td>" + name + "</td><td><a href='javascript:classDelete(" + classnum + ")'>삭제</a></td><td><a href='javascript:classUpdate(" + classnum + ")'>수정</a></td>";
					str += "</tr>";
				$("#classListBody").append(str);
				}
			}, error : function(){
				alert("삭제 에러");
			}
		});
	};
	function fieldList(classnum){
		console.log(classnum);
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
</body>
</html>