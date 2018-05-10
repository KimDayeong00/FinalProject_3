<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.filtertype{width: 100px;height:40px;background-color:#525f78; margin:2px;padding: 10px;text-align:center;border: #336600 1px solid;border-radius:0px;font-size: 15px;}
.container{width:1000px;}
#item{word-wrap:break-word; width:250px;}
#bunryu{width:1000px;}
.mystyle{background-color: #00ab33;}
</style>
<div id="wrap" class="container">

<div id="bunryu" style="margin-left: 200px;">

<ul class="list-inline">
	<li>분류</li>
	<c:forEach var="fieldvo" items="${fieldvo}">
	<li><a href="<c:url value='/item/fielditemlist?fieldnum=${fieldvo.fieldnum }&classnum=${fieldvo.classnum }'/>">${fieldvo.name }</a></li>
	</c:forEach>
</ul>
	</div>
<br>

<div id="cont" >
<ul class="list-inline">

	<c:forEach var="filtertypevo" items="${filtertypevo }" >

			
			<div class="filtertype" ><li><font color="white">${filtertypevo.ft_name }</font></li></div>
			
		
			
			         
			<c:forEach var="map" items="${map }">

				<c:forEach var="filtercontent" items="${map.value }">
				<c:if test="${ filtercontent.ft_num==filtertypevo.ft_num}">
					

						<div class="btn-group" data-toggle="buttons">
		 <label class="btn"  >
	<input id="${filtercontent.fc_num }" type="checkbox" name="check" value="${filtercontent.fc_num }" onclick="prev(event)"> ${filtercontent.fc_name }
  </label> 
</div>
					
					</c:if>
				</c:forEach>

			</c:forEach>
			
	
	</c:forEach>
	</ul>

			




<div id="content"  style="margin-left: 150px;">
<c:set var="i" value="0" />
<c:set var="j" value="3" />

<table >

       <c:forEach var="itemvo" items="${itemvo}">
            <c:if test="${i%j == 0 }">
               <tr>
            </c:if>
                    <td style="size: 240px;" id="item">
                <a id="${itemvo.p_num }" href="<c:url value='/item/detail?p_num=${itemvo.p_num }'/>">   <img style="width: 170px; height:170px;" src="<c:url value='/resources/itemimage/${itemvo.image_name }'/>"> <br> ${itemvo.item_name }</a><br>
                
			</td>
            <c:if test="${i%j == j-1 }">
                </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
        </c:forEach>

 

</table>




</div>

<div id="page" style="margin-left: 400px;" >
  <ul class="pagination">
	<c:choose>

		<c:when test="${pgchk eq 'class'}">
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
				 <li><a aria-label="Previous" href="<c:url value='/item/classitemlist?pageNum=${pu.startPageNum-1 }&classnum=${classnum }'/>"><span aria-hidden="true">&laquo;</span></a></li>
				</c:when>
				<c:otherwise>
		<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">&laquo;</span></a> </li>
	</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						 <li class="active"><a href="<c:url value='/item/classitemlist?pageNum=${i }&classnum=${classnum }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/item/classitemlist?pageNum=${i }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				  <li class="disabled"><a href="<c:url value='/item/classitemlist?pageNum=${pu.endPageNum+1 }&classnum=${classnum }'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:when>
			<c:otherwise>
		  <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:otherwise>
		</c:choose>
		
	</c:when>

		<c:when test="${pgchk eq 'field'}">

					<c:choose>
				<c:when test="${pu.startPageNum>9 }">
				 <li><a aria-label="Previous" href="<c:url value='/item/classitemlist?pageNum=${pu.startPageNum-1 }&classnum=${classnum }'/>"><span aria-hidden="true">&laquo;</span></a></li>
				</c:when>
				<c:otherwise>
		<li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">&laquo;</span></a> </li>
	</c:otherwise>
			</c:choose>

				<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						 <li class="active"><a href="<c:url value='/item/classitemlist?pageNum=${i }&classnum=${classnum }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/item/classitemlist?pageNum=${i }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				  <li class="disabled"><a href="<c:url value='/item/classitemlist?pageNum=${pu.endPageNum+1 }&classnum=${classnum }'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:when>
			<c:otherwise>
		  <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:otherwise>
		</c:choose>
		
	</c:when>

	</c:choose>
</ul>
</div>
</div>
</div>

<!--  -->


<!--          
<div class="btn-group" data-toggle="buttons">
  <label class="btn">
    <input type="checkbox" > Check2dsfs
  </label>
</div> -->

   
<!--  -->
<script>

$(".btn").on('click',function(){
    var $input = $(this).find('input');
    $(this).toggleClass('mystyle');
    if ($(this).hasClass('mystyle')) {
    	$input.prop("checked",true);       
        var sql=getSql();
    } else {
        $input.prop("checked",false);

    }
   
//	alert(${classnum});
//	alert(${fieldnum});
//	alert(sql);
console.log("sql=>" + sql);
	var plus="";
	var content=document.getElementById("content");
		$.ajax({
			url:"<c:url value='/item/itemlist?classnum="+${classnum}+"&fieldnum="+${fieldnum}+"&sql="+sql+"'/>",
			dataType:"json",
			success:function(data){
				$("#page").html("");
					$("#content").html("");
				for(var i=0;i<data.itemvo.length; i++){
					$("#content").append("<a href='<c:url value='/item/detail?p_num="+data.itemvo[i].p_num+"'/>'>"+data.itemvo[i].item_name);
					var str=data.itemvo[i].item_name;
					alert(str);
					plus+=str;
				}				
			}	
		});
    return false; //Click event is triggered twice and this prevents re-toggling of classes
});

	function prev(e){
		e.preventDefault();	
	}
/*		console.log(classnum+","+fieldnum)
		var sql=getSql();
		alert(classnum);
		alert(fieldnum);
		alert(sql);
		var plus="";
		var content=document.getElementById("content");
 		$.ajax({
 			url:"<c:url value='/item/itemlist?classnum="+classnum+"&fieldnum="+fieldnum+"&sql="+sql+"'/>",
 			dataType:"json",
 			success:function(data){
 				$("#page").html("");
 					$("#content").html("");
 				for(var i=0;i<data.itemvo.length; i++){
 					$("#content").append("<a href='<c:url value='/item/detail?p_num="+data.itemvo[i].p_num+"'/>'>"+data.itemvo[i].item_name);
 					var str=data.itemvo[i].item_name;
 					alert(str);
 					plus+=str;
 				}	
 				
 				
 
 				
 				
 			}	
 		});
 		
	}*/
	function getSql(){
		var check=document.getElementsByName("check");
		var chk=0;
		var sql="";
		console.log("check" + check.length)
		for(var i=0;i<check.length;i++){
			if(check[i].checked==true){
				chk++;
				if(chk>1){
					
				sql +="or fc_num="+check[i].value;
				}else if(chk==1){
					sql+="fc_num="+check[i].value;
				}
				console.log("for..........")
			}
		}
		console.log("sql::::" + sql)
		return sql;
	}



	</script>
