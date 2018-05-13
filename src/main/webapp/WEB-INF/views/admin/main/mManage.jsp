<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<style type="text/css">
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
}

/*Tab Conent CSS*/
.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
</style>


<!-- page content -->
<script
	src="<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js" />"></script>
<!-- Datatables -->
<link
	href="<c:url value="/resources/admin/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/admin/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/admin/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/admin/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/admin/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" />"
	rel="stylesheet">


<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});
	});
</script>

<script>

function memberout(email) {
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	 	location.href = '<c:url value="/admin/memDel?email='+email+'&gubun=member" />';
	  }else{   //취소
	      return;
	  }
}
function petsitterout(email) {
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	 	location.href = '<c:url value="/admin/memDel?email='+email+'&gubun=petsitter" />';
	  }else{   //취소
	      return;
	  }
}


function memberupdate(email){
	
	var pop = window.open("<c:url value='/admin/update?email="+email+"&gubun=member' />","pop","width=570,height=800, scrollbars=yes, resizable=yes"); 
	
}

function petsitterupdate(email) {
	var pop = window.open("<c:url value='/admin/update?email="+email+"&gubun=petsitter' />","pop","width=570,height=800, scrollbars=yes, resizable=yes"); 
	
}


</script>







<!-- page content -->
<div class="right_col" role="main">



	<div id="wrapper">
		<!--탭 메뉴 영역 -->
		<ul class="tabs">
			<li><a href="#tab1">일반회원</a></li>
			<li><a href="#tab2">펫시터</a></li>
		</ul>

		<!--탭 콘텐츠 영역 -->
		<div class="tab_container">

			<div id="tab1" class="tab_content">


				<!-- 1번쨰 -->
					 <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h3>일반회원목록 </h3>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                         <tr>
                          <th>이메일</th>
                          <th>이름</th>
                          <th>전화번호</th>
                          <th>주소</th>
                           <th>수정</th>
                          <th>탈퇴</th>
                        </tr>
                      </thead>


                      <tbody>
                        
                        <c:forEach var="memvo" items="${memlist }">
                        <tr>
                          <td>${memvo.m_email }</td>
                          <td>${memvo.m_name }</td>
                          <td>${memvo.m_phone }</td>
                          <td>${memvo.m_addr }</td>
                          <td><a href="#" onclick="memberupdate('${memvo.m_email }');">수정</a></td>
                          <td><a href="#" onclick="memberout('${memvo.m_email }');">탈퇴</a></td>
                        </tr>
                        
                        
                        
                        
                        </c:forEach>
                        
                        
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>


				<!-- 1번째 -->
			</div>


			<div id="tab2" class="tab_content">
			
			
				<!-- 2번째 -->
				 <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h3>펫시터목록 </h3>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  
                    <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
                      <thead>
                        <tr>
                          <th>이메일</th>
                          <th>이름</th>
                          <th>전화번호</th>
                          <th>주소</th>
                           <th>수정</th>
                          <th>탈퇴</th>
                        </tr>
                      </thead>


                      <tbody>
                       <c:forEach var="petvo" items="${petlist }">
                        <tr>
                          <td>${petvo.ps_email }</td>
                          <td>${petvo.ps_name }</td>
                          <td>${petvo.ps_phone }</td>
                          <td>${petvo.ps_addr1 }</td>
                          <td><a href="#" onclick="petsitterupdate('${petvo.ps_email }');">수정</a></td>
                          <td><a href="#" onclick="petsitterout('${petvo.ps_email }');">탈퇴</a></td>
                        </tr>
                        
                        
                        
                        
                        </c:forEach>
                    
                      </tbody>
                      
                      
                    </table>
                  </div>
                </div>
              </div>
			
			
			
			
			
				<!-- 2번째 -->
			
			</div>


		</div>




	</div>

</div>
<!-- /page content -->




<!-- iCheck -->
<script
	src="<c:url value="/resources/admin/vendors/iCheck/icheck.min.js" />"></script>
<!-- Datatables -->
<script
	src="<c:url value="/resources/admin/vendors/datatables.net/js/jquery.dataTables.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js" />"></script>
<script
	src=" <c:url value="/resources/admin/vendors/datatables.net-buttons/js/buttons.flash.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/buttons.print.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js" />"></script>
<script
	src=" <c:url value="/resources/admin/vendors/jszip/dist/jszip.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/pdfmake/build/pdfmake.min.js" />"></script>
<script
	src="<c:url value="/resources/admin/vendors/pdfmake/build/vfs_fonts.js" />"></script>


<script src="<c:url value="/resources/build/js/custom.min.js" />"></script>


