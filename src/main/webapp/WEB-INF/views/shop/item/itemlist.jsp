<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.filtertype{width: 100px;height:40px;background-color:#525f78; margin:2px;padding: 10px;text-align:center;border: #336600 1px solid;border-radius:0px;font-size: 15px;}
.container{width:1000px;}
#item{word-wrap:break-word; width:250px;}
#bunryu{width:1000px;}
.mystyle{background-color: #ffff66;}
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

<table>

       <c:forEach var="itemvo" items="${itemvo}">
            <c:if test="${i%j == 0 }">
               <tr>
            </c:if>
                    <td style="size: 250px;" id="item">
                <a id="${itemvo.p_num }" href="<c:url value='/item/detail?p_num=${itemvo.p_num }'/>">   <img style="width: 170px; height:170px;" src="<c:url value='/resources/itemimage/${itemvo.image_name }'/>"> <br><font color="#004B91" >${itemvo.item_name }</font></a><br>
               <span style="font-weight: bold;color: #b12603;"> <fmt:formatNumber value="${itemvo.price}" pattern="#,###.##"/>원</span>
			</td>
            <c:if test="${i%j == j-1 }">
                </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
        </c:forEach>
</table>



<br>
<div id="page" style="margin-left: 260px;" >
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
				 <li><a aria-label="Previous" href="<c:url value='/item/fielditemlist?pageNum=${pu.startPageNum-1 }&fieldnum=${fieldnum }&classnum=${classnum }'/>"><span aria-hidden="true">&laquo;</span></a></li>
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
						 <li class="active"><a href="<c:url value='/item/fielditemlist?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
					 <li><a href="<c:url value='/item/fielditemlist?pageNum=${i }&fieldnum=${fieldnum }&classnum=${classnum }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				  <li class="disabled"><a href="<c:url value='/item/fielditemlist?pageNum=${pu.endPageNum+1 }&classnum=${classnum }&fieldnum=${fieldnum }'/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
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
</div>

<script>

function Comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var sql="";
$(".btn").on('click',function(){
    var $input = $(this).find('input');
    $(this).toggleClass('mystyle');
    if ($(this).hasClass('mystyle')) {
    	$input.prop("checked",true);       
        sql=getSql();
    } else {
        $input.prop("checked",false);

    }
    aaa(1,'${fieldnum}','${classnum}');
});
   function aaa(pageNum,fieldnum,classnum){
console.log("sql=>" + sql);
	var plus="";
	var content=document.getElementById("content");
	$.ajax({
		url:"<c:url value='/item/itemlist?classnum="+classnum+"&fieldnum="+fieldnum+"&sql="+sql+"&pageNum="+pageNum+"'/>",
		dataType:"json",
		success:function(data){
			console.log(data);
			$("#page").html("");
				$("#content").html("");
				var k=0;
				var j=3;
				var html="";
				html+="<table >";
				      for(var i=0;i<data.itemvo.length;i++){
				          var itemvo=data.itemvo[i];
				            if(k%j == 0){
				               html+="<tr>";
				            }
				           html+="<td style='size: 260px' id='item'>";
				        html+="<a id='" + itemvo.p_num +"' href='<c:url value='/item/detail?p_num="+ itemvo.p_num +"'/>'>" ;
				        html+="<img style='width: 170px; height:170px;' src='<c:url value='/resources/itemimage/"+ itemvo.image_name + "'/>'> <br>";
				           html+="<font color='#004B91'>"+ itemvo.item_name +"</font></a><br>";
				          html+= "<span style='font-weight: bold;color: #b12603;'>" + Comma(itemvo.price) +"원</span></td>";
				            if(k%j == j-1 ){
				             	html+="</tr>"
				            }
				            k=k+1;
				     }     
				html +="</table>";
				html+="<div id='page' style='margin-left:250px;'>";
				html+="<ul class='pagination'>";
				
				
				
				
				
				
				if(data.pu.startPageNum>9 ){
					 html += "<li><a aria-label='Previous' href=\"javascript:aaa("+ (i-1)+ ",'"+data.fieldnum+"','"+data.classnum+"')\"><span aria-hidden='true'>&laquo;</span></a></li>";
				}else{
							
				html+="<li class='disabled'><a aria-label='Previous' href='#'><span aria-hidden='true'>&laquo;</span></a> </li>";
				}
	for(var i=data.pu.startPageNum; i<=data.pu.endPageNum; i++){
			console.log(i+","+sql+","+ data.fieldnum+"','"+data.classnum);
				if(i==data.pu.pageNum){
				 html+= "<li class='active'><a href=\"javascript:aaa("+ i+ ",'"+data.fieldnum+"','"+data.classnum+"')\">"+i+"</a></li>";
				}
				else{
					html+= "<li ><a href=\"javascript:aaa("+ i+ ",'"+data.fieldnum+"','"+data.classnum+"')\">"+i+"</a></li>";
				 }
	}

				if(data.pu.endPageNum<data.pu.totalPageCount){
					html+= "<li class='disabled'><a aria-label='Next' href=\"javascript:aaa("+ (i+1)+ ",'"+data.fieldnum+"','"+data.classnum+"')\"><span aria-hidden='true'>&raquo;</span></a></li>";
				}else{
					html+="<li class='disabled'><a href='###' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}


				$("#content").html(html);
				
				
		<%-- //////////////////////////////////////////////////////////////////////////////////////페이징 ////--%>
		
	

			}	
		});
    return false; //Click event is triggered twice and this prevents re-toggling of classes
}

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
