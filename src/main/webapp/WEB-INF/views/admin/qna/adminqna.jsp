<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>1:1 문의관련</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            

             

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>문의내역<small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                     
                    </p>
					
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>문의번호</th>
                          <th>문의날짜</th>
                          <th>문의제목</th>
                          <th>상세보기</th>
                          <th>답변현황</th>
                        </tr>
                      </thead>
                      
                      <tbody id = "insertbody">
						<c:forEach var = "vo" items = "${adminlist }" varStatus="a">
							<tr onclick="javascript:adminform('${vo.title}')">
								<td>${vo.qnum }</td>
								<td><span id='regdate${a.index }'><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy/MM/dd" /></span></td>
								<td>${vo.title }</td>
								<td><a href="javascript:clickinfo('${vo.qnum }','${vo.title }','${vo.content }','${vo.regdate }','${vo.refer }','${vo.lev }','${vo.step }','${vo.p_num }')">상세보기</a></td>
								<td><a href="javascript:admindetail('${vo.qnum }','${vo.comments }')">${vo.comments }</a></td>
							</tr>
						</c:forEach>
					</tbody>
                    </table>
      </div>
    </div>
    </div>
    </div>
    </div>
    
    <script type="text/javascript">
    	var pop;
    	function clickinfo(qnum, title, content, regdate, refer, lev, step, p_num){
    		pop = window.open("<c:url value='/qna/adminqnaPopup?qnum="+qnum+"&title="+title+"&content="+content+"&p_num="+p_num+"&refer="+refer+"&lev="+lev+"&step="+step+"' />","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    	}
    	
    	function admindetail(qnum, comments){
    		if(comments=='답변완료'){
    			pop = window.open("<c:url value='/qna/admindetail?qnum="+qnum+"' />", "pop","width=570,height=320, scrollbars=yes, resizable=yes"); 
    		}else if(comments=='처리중'){
    			alert("답변을 입력해주세요");
    		}
    	}
    </script>
    

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

  </body>
</html>