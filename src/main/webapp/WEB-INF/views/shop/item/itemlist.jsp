<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.filtertype{width: 100px;height:40px;background-color:#525f78; margin:2px;padding: 10px;text-align:center;border: #336600 1px solid;border-radius:10px;font-size: 15px;}
.container{width:1000px;}
#item{word-wrap:break-word; width:220px;}
#bunryu{width:1000px;}
</style>
<div id="wrap" class="container">

<div id="bunryu">
<table>
	<tr>
		<td>분류</td>
		<c:forEach var="fieldvo" items="${fieldvo}">
			<td style="color: red"><a href="<c:url value='/item/fielditemlist?fieldnum=${fieldvo.fieldnum }&classnum=${fieldvo.classnum }'/>">${fieldvo.name }</a></td>
		</c:forEach>
	</tr>
</table>
	</div>

<div id="cont">
<table class="table table-hover" border="1"> 
	<c:forEach var="filtertypevo" items="${filtertypevo }">
		<tr>
			<td style="color: white">
			
			<div class="filtertype">${filtertypevo.ft_name }</div>
			
			</td>
			<c:forEach var="map" items="${map }">

				<c:forEach var="filtercontent" items="${map.value }">
					<c:if test="${ filtercontent.ft_num==filtertypevo.ft_num}">
						<td><input id="${filtercontent.fc_num }" type="checkbox"
							name="check" value="${filtercontent.fc_num }"
							onclick="getchk(${classnum},${fieldnum })"> <a href="">${filtercontent.fc_name }</a>

						</td>
					</c:if>
				</c:forEach>

			</c:forEach>
		</tr>
	</c:forEach>
</table>




<div id="content" >
<c:set var="i" value="0" />
<c:set var="j" value="3" />

<table >

       <c:forEach var="itemvo" items="${itemvo}">
            <c:if test="${i%j == 0 }">
               <tr>
            </c:if>
                    <td style="size: 220px;" id="item">
                    <img src="<c:url value='/resources/itemimage/${itemvo.item_savefilename }'/>"><br>
                    <a id="${itemvo.p_num }" 
			href="<c:url value='/item/detail?p_num=${itemvo.p_num }'/>">${itemvo.item_name }</a>
			${itemvo.p_num }
			</td>
            <c:if test="${i%j == j-1 }">
                </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
        </c:forEach>

 

</table>




</div>

<div id="page">
	<c:choose>

		<c:when test="${pgchk eq 'class'}">
			<c:choose>
				<c:when test="${pu.startPageNum>9 }">
					<a href="<c:url value='/item/classitemlist?pageNum=${pu.startPageNum-1 }&classnum=${classnum }'/>">이전</a>
				</c:when>
				<c:otherwise>
		이전
	</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						<a
							href="<c:url value='/item/classitemlist?pageNum=${i }&classnum=${classnum }'/>"><span
							style='color: blue'>${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/item/classitemlist?pageNum=${i }&classnum=${classnum }'/>"><span
							style='color: #555'>${i}</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	

		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/item/classitemlist?pageNum=${pu.endPageNum+1 }&classnum=${classnum }'/>">다음</a>
			</c:when>
			<c:otherwise>
		다음
	</c:otherwise>
		</c:choose>
		
	</c:when>

		<c:when test="${pgchk eq 'field'}">

	<c:choose>
				<c:when test="${pu.startPageNum>9 }">
					<a href="<c:url value='/item/classitemlist?pageNum=${pu.startPageNum-1 }&classnum=${classnum }'/>">이전</a>
				</c:when>
				<c:otherwise>
		이전
	</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<!-- 현재페이지 색상 다르게 표시하기 -->
						<a
							href="<c:url value='/item/fielditemlist?pageNum=${i }&classnum=${classnum }&fieldnum=${fieldnum }'/>"><span
							style='color: red'>${i }</span></a>
					</c:when>
					<c:otherwise>
						<a
							href="<c:url value='/item/fielditemlist?pageNum=${i }&classnum=${classnum }&fieldnum=${fieldnum }'/>"><span
							style='color: blue'>${i}</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
					<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount }">
				<a href="<c:url value='/item/classitemlist?pageNum=${pu.endPageNum+1 }&classnum=${classnum }'/>">다음</a>
			</c:when>
			<c:otherwise>
		다음
	</c:otherwise>
		</c:choose>
			
		</c:when>

	</c:choose>

</div>
</div>
</div>
<script>
		
	
	function getchk(classnum,fieldnum){
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
 		
	}
	function getSql(){
		var check=document.getElementsByName("check");
		var chk=0;
		var sql="";
		
		for(var i=0;i<check.length;i++){
			if(check[i].checked==true){
				chk++;
				if(chk>1){
					
				sql +="or fc_num="+check[i].value;
				}else if(chk==1){
					sql+="fc_num="+check[i].value;
				}
				
			}
		}
		return sql;
	}
	
	</script>
