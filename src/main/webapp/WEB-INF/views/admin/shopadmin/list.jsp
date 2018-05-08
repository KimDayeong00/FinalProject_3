<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- page content -->
        <div class="right_col" role="main" >
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Users <small>Some examples to get you started</small></h3>
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
            
            
     <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                  <h2>카테고리</small></h2>
                  <div class="x_content">
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th>대분류</th>
                          <th>중분류</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="a" items="${classfield }">
							<tr>
								<td style="width: 100px;">${a.name }</td>
								<c:forEach var="b" items="${a.list }">
									<td style="width: 100px;"><a href="<c:url value="/shopadmin/list?fieldnum=${b.fieldnum }" />">${b.name }</a></td>
								</c:forEach>
							</tr>
							</c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>         
             </div>    
            <div class="clearfix"></div>
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Plus Table Design</small></h2>
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
                    <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
                      <thead>
                        <tr>
                          <th>
							 <th><input type="checkbox" id="check-all" class="flat"></th>
						  </th>
                          <th>상품번호</th>
                          <th>상품이름</th>
                          <th>가격</th>
                          <th>등록날짜</th>
                          <th>재고</th>
                          <th>중분류번호</th>
                          <th>상품설명</th>
                          <th>수정</th>
                          <th>삭제</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="i" items="${itemlist }">
                        <tr>
                          <td>
							 <th><input type="checkbox" id="check-all" class="flat"></th>
						  </td>
                          <td>${i.p_num }</td>
                          <td>${i.item_name }</td>
                          <td>${i.price }</td>
                          <td>${i.regdate }</td>
                          <td>${i.stock }</td>
                          <td>${i.fieldnum }</td>
                          <td>${i.content }</td>
                          <td><a href="<c:url value="/shopadmin/update?p_num=${i.p_num }" />">수정</a></td>
                          <td><a href="<c:url value="/shopadmin/delete?p_num=${i.p_num }&fieldnum=${i.fieldnum }" />">삭제</a></td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          
        </div>
        </div>
        <!-- /page content -->
