<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!-- Bootstrap -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value="/resources/admin/vendors/nprogress/nprogress.css" />" rel="stylesheet">
    <!-- iCheck -->
    <link href="<c:url value="/resources/admin/vendors/iCheck/skins/flat/green.css" />" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="<c:url value="/resources/admin/vendors/google-code-prettify/bin/prettify.min.css" />" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" />" rel="stylesheet">
    <!-- Select2 -->
    <link href="<c:url value="/resources/admin/vendors/select2/dist/css/select2.min.css" />" rel="stylesheet">
    <!-- Switchery -->
    <link href="<c:url value="/resources/admin/vendors/switchery/dist/switchery.min.css" />" rel="stylesheet">
    <!-- starrr -->
    <link href="<c:url value="/resources/admin/vendors/starrr/dist/starrr.css" />" rel="stylesheet">
    <!-- JQVMap -->
    <link href="<c:url value="/resources/admin/vendors/jqvmap/dist/jqvmap.min.css" />" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="<c:url value="/resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.css" />" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<c:url value="/resources/build/css/custom.min.css" />" rel="stylesheet">
    
    
	
  	<!-- jQuery -->
    <script src="<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js" />"></script>
    <!-- Bootstrap -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js" />"></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/admin/vendors/fastclick/lib/fastclick.js" />"></script>
    <!-- NProgress -->
    <script src="<c:url value="/resources/admin/vendors/nprogress/nprogress.js" />"></script>
    <!-- Chart.js -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="<c:url value="/resources/admin/vendors/gauge.js/dist/gauge.min.js" />"></script>
    <!-- bootstrap-progressbar -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js" />"></script>
    <!-- iCheck -->
    <script src="<c:url value="/resources/admin/vendors/iCheck/icheck.min.js" />"></script>
    <!-- Skycons -->
    <script src="<c:url value="/resources/admin/vendors/skycons/skycons.js" />"></script>
     <!-- Flot -->
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.pie.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.time.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.stack.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/Flot/jquery.flot.resize.js" />"></script>
    <!-- Flot plugins -->
    <script src="<c:url value="/resources/admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/flot-spline/js/jquery.flot.spline.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/flot.curvedlines/curvedLines.js" />"></script>
    <!-- DateJS -->
    <script src="<c:url value="/resources/admin/vendors/DateJS/build/date.js" />"></script> 
	 <!-- JQVMap -->
    <script src="<c:url value="/resources/admin/vendors/jqvmap/dist/jquery.vmap.js" />"></script> 
    <script src="<c:url value="/resources/admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js" />"></script> 
    <script src="<c:url value="/resources/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js" />"></script> 
	<!-- bootstrap-daterangepicker -->
    <script src="<c:url value="/resources/admin/vendors/moment/min/moment.min.js" />"></script> 
    <script src="<c:url value="/resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.js" />"></script> 
    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/resources/build/js/custom.min.js" />"></script>
  	<!-- PNotify -->
    <script src="<c:url value="/resources/admin/vendors/pnotify/dist/pnotify.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/pnotify/dist/pnotify.buttons.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/pnotify/dist/pnotify.nonblock.js" />"></script>
  	 
  	 <!-- bootstrap-wysiwyg -->
    <script src="<c:url value="/resources/admin/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/jquery.hotkeys/jquery.hotkeys.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/google-code-prettify/src/prettify.js" />"></script>
    <!-- jQuery Tags Input -->
    <script src="<c:url value="/resources/admin/vendors/jquery.tagsinput/src/jquery.tagsinput.js" />"></script>
    <!-- Switchery -->
    <script src="<c:url value="/resources/admin/vendors/switchery/dist/switchery.min.js" />"></script>
    <!-- Select2 -->
    <script src="<c:url value="/resources/admin/vendors/select2/dist/js/select2.full.min.js" />"></script>
    <!-- Parsley -->
    <script src="<c:url value="/resources/admin/vendors/parsleyjs/dist/parsley.min.js" />"></script>
    <!-- Autosize -->
    <script src="<c:url value="/resources/admin/vendors/autosize/dist/autosize.min.js" />"></script>
    <!-- jQuery autocomplete -->
    <script src="<c:url value="/resources/admin/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js" />"></script>
    <!-- starrr -->
    <script src="<c:url value="/resources/admin/vendors/starrr/dist/starrr.js" />"></script>
  	
  	<!-- Datatables -->
    <script src="<c:url value="/resources/admin/vendors/datatables.net/js/jquery.dataTables.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/buttons.flash.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-buttons/js/buttons.print.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/jszip/dist/jszip.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/pdfmake/build/pdfmake.min.js" />"></script>
    <script src="<c:url value="/resources/admin/vendors/pdfmake/build/vfs_fonts.js" />"></script>
    
    					<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상세보기</h2>
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

                    <form class="form-horizontal form-label-left" action = "<c:url value='/qna/admininsert'/>">
                      <div class="item form-group">
                    <input type = "hidden" id = "qnum" name = "qnum" value = "${qnum }">
                    <input type = "hidden" id = "aqrefer" name = "aqrefer" value = "${refer }">
                    <input type = "hidden" id = "aqlev" name = "aqlev" value = "${lev }">
                    <input type = "hidden" id = "aqstep" name = "aqstep" value = "${step }">
                   
                 
                       <%--  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email" id="regdate">문의날짜
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <fmt:formatDate value = "${regdate}" type="DATE" pattern="yyyy/MM/dd"/>
                        </div> --%>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email" id="title">문의제목
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email2" name="aqtitle" class="form-control col-md-7 col-xs-12" readonly="readonly" value = "${title}">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea" id="content">문의내용
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="textarea" required="required" name="aqcontent" class="form-control col-md-7 col-xs-12" readonly="readonly">${content }</textarea>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea" id="content">답변내용
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="textarea" required="required" name="aqcomments" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>
                      </div>
                        <div class="col-md-6 col-md-offset-3">
                          <button type="reset" class="btn btn-primary" onclick="outPopup()">취소</button>
                          <button id="insert" type="submit" class="btn btn-success">답변하기</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
        
<script type="text/javascript">
	function aaa(){
		    window.opener.testCheck(); 
		return true;
	}
	function outPopup(){
		window.close();
	}
</script>