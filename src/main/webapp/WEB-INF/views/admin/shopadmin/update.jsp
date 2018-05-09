<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function handleFileSelect() 
{
    var files = document.getElementById('file1').files[0]; //파일 객체
    var reader = new FileReader();
         
    reader.onload = (function(theFile) 
    {
        return function(e) 
        {
            var img_view = ['<img src=" ', e.target.result, ' " title=" ', escape(theFile.name), ' " style="width:210px;height:200px;"/>'].join('');                
            document.getElementById('image_name').innerHTML = img_view;
        };
    })(files);
    reader.readAsDataURL(files);    
}
function asas(){
	var files = $("#mulfile")[0].files;
	document.getElementById('item_savefilename').innerHTML="";
	for (var i = 0; i < files.length; i++){
	var reader = new FileReader();	
	reader.onload = (function(theFile) 
			{
				 return function(e) 
				 {
				      var img_view = ['<img src=" ', e.target.result, ' " title=" ', escape(theFile.name), ' " style="width:210px;height:200px;"/>'].join('');                
				      document.getElementById('item_savefilename').innerHTML += img_view;
				 };
			})(files);
			reader.readAsDataURL(files[i]);    
	/* alert(files[i].name); */
	}
}
</script>
<form method="post" action="<c:url value='/shopadmin/updateOk'/>" enctype="multipart/form-data" name="frm" onsubmit="return aaa()">
	<table class="table table-striped" style="float:left; margin-left:300px;">

		<thead>
			<tr>
				<th colspan="2" align="center">상품등록하기</th>
			</tr>
		</thead>
		<tbody>
		<tr>
				<td><div id="classnum">필터선택</div></td>
				<td><div id="fieldnum">
			<c:forEach var="filtertypevo" items="${filtertypevo }" >
				<br />${filtertypevo.ft_name } <br />
				<c:forEach var="map" items="${map }">
					<c:forEach var="filtercontent" items="${map.value }">
						<c:if test="${ filtercontent.ft_num==filtertypevo.ft_num}">
							<c:choose>
								<c:when test="${filtertypevo.ft_num==1}">
									<input id="${filtercontent.fc_num }"  type="radio" class="filterchk"
									name="filterchk" value="${filtercontent.fc_num }"> <a href="#">${filtercontent.fc_name }</a>
								</c:when>
								<c:otherwise>
									<input id="${filtercontent.fc_num }"  type="checkbox" class="filterchk"
									name="filterchk" value="${filtercontent.fc_num }"> <a href="#">${filtercontent.fc_name }</a>
								
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:forEach>
			</div></td>
			</tr>
			<tr>
				<td>대표이미지</td>
				<td><input type="file" name="file1" id="file1" onchange="handleFileSelect()">
				<div id="image_name"><img style="width: 200px;height: 200px;" src="<c:url value="/resources/itemimage/${list.image_name }" />" alt="" /></div>
				</td>
			</tr>
			<tr>
				<td>상세이미지</td>
				<td><input multiple="multiple" type="file" id="mulfile" class="mulfile" name="multifile" onchange="asas(this.value)" />
				<div id="item_savefilename">
				<c:forEach var="il" items="${ilist}">
					<img style="width: 200px;height: 200px;" src="<c:url value="/resources/itemimage/${il.item_savefilename }" />" alt="" />
				</c:forEach>
				</div>
				</td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="item_name" value="${list.item_name }"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="price" value="${list.price }"></td>
			</tr>
			<tr>
				<td>입고수량</td>
				<td><input type="text" name="stock" value="${list.stock }"></td>
			</tr>
			<tr>
				<td>내용입력</td>
				<td><div class="x_content">
                  <div id="alerts"></div>
                  <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li>
                          <a data-edit="fontSize 5">
                            <p style="font-size:17px">Huge</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 3">
                            <p style="font-size:14px">Normal</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 1">
                            <p style="font-size:11px">Small</p>
                          </a>
                        </li>
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                      <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                      <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                      <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                      <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                      <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                      <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                      <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                      <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                      <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                      <div class="dropdown-menu input-append">
                        <input class="span2" placeholder="URL" type="text" data-edit="createLink">
                        <button class="btn" type="button">Add</button>
                      </div>
                      <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                      <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage">
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                      <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                    </div>
                  </div>

                  <div id="editor-one" class="editor-wrapper placeholderText" contenteditable="true"></div>
                  <textarea style="display:none;"></textarea>
 
                </div></td>
			</tr>
			
			<tr>
				<td>상품등록</td>
				<td><input type="submit" value="상품등록"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" id="p_num" name="p_num" value="${list.p_num }" />
	<input type="hidden" id="fieldnum" name="fieldnum" value="${list.fieldnum }" />
	<input type="hidden" id="content" name="content" />
</form>
<script type="text/javascript">
	function aaa(){
		$("#content").val($("#editor-one").html());
		return true;
	}
	$(document).ready(function(){
		<c:forEach var="fl" items="${flist }">
			$(".filterchk").each(function(){
				if('${fl.fc_num}'==$(this).val()){
					$(this).prop("checked",true);
				}
			})
		</c:forEach>
		$("#editor-one").html('${list.content}');
	})
</script>
<!-- include libraries(jQuery, bootstrap) -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


