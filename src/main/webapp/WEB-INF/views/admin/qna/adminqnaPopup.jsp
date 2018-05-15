<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>

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
                    <input type = "hidden" id = "qnum" name = "qnum">
                    <input type = "hidden" id = "refer" name = "aqrefer">
                    <input type = "hidden" id = "lev" name = "aqlev">
                    <input type = "hidden" id = "step" name = "aqstep">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email" id="regdate">문의날짜
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email" class="form-control col-md-7 col-xs-12" readonly="readonly">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email" id="title">문의제목
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email2" name="aqtitle" class="form-control col-md-7 col-xs-12" readonly="readonly">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea" id="content">문의내용
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="textarea" required="required" name="aqcontent" class="form-control col-md-7 col-xs-12" readonly="readonly"></textarea>
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
                          <button type="reset" class="btn btn-primary">취소</button>
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
        
<script type="text/javascript">
function aaa(){
	    window.opener.testCheck(); 
	return true;
}
</script>
