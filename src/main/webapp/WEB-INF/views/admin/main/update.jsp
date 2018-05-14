<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	function goOpener() {
		
		opener.name = "mManager"; // 부모창의 이름 설정
		document.popup.target = "mManager"; // 타켓을 부모창으로 설
		document.popup.action = "<c:url value='/admin/updateOK_m' />";
		document.popup.submit();
		self.close();
	}
	
	function goOpener1() {
		opener.name = "mManager"; // 부모창의 이름 설정
		document.popup1.target = "mManager"; // 타켓을 부모창으로 설
		document.popup1.action = "<c:url value='/admin/updateOK_p' />";
		document.popup1.submit();
		self.close();
	}

	function closeP() {
		window.close();
	}
</script>

<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>회원정보수정</h3>
			</div>

			<div class="title_right">
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">

				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">

						<div class="clearfix"></div>
					</div>
					<div class="x_content">

						<c:choose>

							<c:when test="${gubun eq 'member' }">

								<form name="popup" id="popup" class="form-horizontal form-label-left"
									novalidate method="post" action="">


									<span class="section">회원정보</span>

									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">이메일 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="email"  name="m_email"
												required="required" class="form-control col-md-7 col-xs-12" readonly="readonly"
												value="${member.m_email }">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="name">이름 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input  class="form-control col-md-7 col-xs-12"
												data-validate-length-range="6" data-validate-words="2"
												name="m_name" value="${member.m_name }" required="required"
												type="text">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">전화번호 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" name="m_phone"
												data-validate-linked="email" required="required"
												value="${member.m_phone }"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="number">주소 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text"  name="m_addr"
												value="${member.m_addr }" required="required"
												data-validate-minmax="10,100"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="occupation">가입일 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input id="occupation" type="text" name="occupation"
												value="<fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_regdate }" />"
												data-validate-length-range="5,20" readonly="readonly"
												class="optional form-control col-md-7 col-xs-12">
										</div>
									</div>

									<div class="ln_solid"></div>
									<div class="form-group">
										<div class="col-md-6 col-md-offset-3">
											<input type="button" value="취소" class="btn btn-primary"
												onClick="closeP();"> <input type="button"
												value="수정하기" class="btn btn-success" onClick="goOpener();">
										</div>
									</div>
								</form>

							</c:when>
							
							
							<c:when test="${gubun eq 'petsitter' }">

								<form name="popup1" class="form-horizontal form-label-left"
									novalidate  method="post" action="">
								
								<input type="hidden" value="${petsitter.ps_lat }" name = ps_lat>
								<input type="hidden" value="${petsitter.ps_lng }" name = ps_lng>
								
								

									<span class="section">회원정보</span>

									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">이메일 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="email"  name="ps_email"
												required="required" class="form-control col-md-7 col-xs-12" readonly="readonly"
												value="${petsitter.ps_email }">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="name">이름 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input id="name" class="form-control col-md-7 col-xs-12"
												data-validate-length-range="6" data-validate-words="2"
												name="ps_name" value="${petsitter.ps_name }" required="required"
												type="text">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">전화번호 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text"  name="ps_phone"
												data-validate-linked="email" required="required"
												value="${petsitter.ps_phone }"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="number">주소1 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="number" name="ps_addr1"
												value="${petsitter.ps_addr1 }" required="required"
												data-validate-minmax="10,100"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="number">주소2 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="number" name="ps_addr2"
												value="${petsitter.ps_addr2 }" required="required"
												data-validate-minmax="10,100"
												class="form-control col-md-7 col-xs-12">
										</div>
									</div>
									<div class="item form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="occupation">가입일 <span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input id="occupation" type="text" name="ps_regdate"
												value="<fmt:formatDate pattern="yyyy-MM-dd" value="${petsitter.ps_regdate }" />"
												data-validate-length-range="5,20" readonly="readonly"
												class="optional form-control col-md-7 col-xs-12">
										</div>
									</div>

									<div class="ln_solid"></div>
									<div class="form-group">
										<div class="col-md-6 col-md-offset-3">
											<input type="button" value="취소" class="btn btn-primary"
												onClick="closeP();"> <input type="button"
												value="수정하기" class="btn btn-success" onClick="goOpener1();">
										</div>
									</div>
								</form>
							</c:when>
						</c:choose>





					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /page content -->
