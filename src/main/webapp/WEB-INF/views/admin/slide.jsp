<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="<c:url value="/admin/home" />" class="site_title"><i class="fa fa-paw"></i> <span>Pet Care!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="<c:url value="/resources/images/doge.jpg" />" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>어서오세요,</span>
                <h2>관리자님</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li><a href="#"><i class="fa fa-home"></i> Home </a>
                  </li>
                   <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                  <li><a href="#"><i class="fa fa-edit"></i> Forms </a>
                  </li>
                  <li><a href="#"><i class="fa fa-desktop"></i> UI Elements</a>
                    
                  </li>
                  <li><a href="<c:url value="/admin/mManage" />"><i class="fa fa-table"></i> 회원관리 </a>
                  
                  </li>
                  <li><a href="<c:url value="/admin/calc" />"><i class="fa fa-bar-chart-o"></i> 정산 </a>
                 
                  </li>
                  <li><a href="#"> <i class="fa fa-clone"></i>Layouts</a>
                    
                  </li>
                   <li><a href="#"><i class="fa fa-bug"></i> Additional Pages</a>
                   
                  </li>
                </ul>
              </div>
          

            </div>
            <!-- /sidebar menu -->

          
          </div>
        </div>