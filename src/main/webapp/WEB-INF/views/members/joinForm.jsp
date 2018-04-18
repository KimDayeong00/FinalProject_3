<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">


					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name"><strong style="font-size: 18px;">이메일</strong><span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="email" required="required"
													class="form-control col-md-7 col-xs-12">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name"><strong style="font-size: 18px;">비밀번호</strong><span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="pwd" required="required"
													class="form-control col-md-7 col-xs-12">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name"><strong style="font-size: 18px;">비밀번호 확인</strong><span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="pwd_ok" required="required"
													class="form-control col-md-7 col-xs-12">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name"><strong style="font-size: 18px;">이름</strong><span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="name" name="name"
													required="required" class="form-control col-md-7 col-xs-12">
											</div>
										</div>
											<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name"><strong style="font-size: 18px;">전화번호</strong><span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="phone" name="phone"
													required="required" class="form-control col-md-7 col-xs-12">
											</div>
										</div>
											<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name"><strong style="font-size: 18px;">주소</strong><span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="address" name="address"
													required="required" class="form-control col-md-7 col-xs-12">
											</div>
										</div>
										
									
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-primary" type="button" ><a href="<c:url value="/" />" >메인으로</a></button>
												<button class="btn btn-primary" type="reset">초기화</button>
												<button type="submit" class="btn btn-success">가입하기</button>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>


	<!-- jQuery -->
	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<!-- Parsley -->
	<script src="vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>