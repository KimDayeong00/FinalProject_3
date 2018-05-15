<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- include libraries(jQuery, bootstrap) -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script>

function select(){
	var classsel = document.getElementById("classsel");
	var val = classsel.options[classsel.selectedIndex].value;
		$.ajax({
 			url:"<c:url value='/shopadmin/fieldlist?classnum="+val+"'/>",
 			dataType:"json",
 			success:function(data){
 				$("#fieldsel").empty();
 				$("#fieldsel").append("<option>선택하세요.</option>");
 				for(var i=0;i<data.fieldvo.length;i++){
 					var option ="<option value="+data.fieldvo[i].fieldnum+">"+data.fieldvo[i].name+"</option>";
 					$("#fieldsel").append(option);
 				}
 			}		
 		});
}
/* function select1(){
	var classsel = document.getElementById("classsel");
	var fieldsel = document.getElementById("fieldsel");
	var classnum = classsel.options[classsel.selectedIndex].value;
	var fieldnum = fieldsel.options[fieldsel.selectedIndex].value;
	console.log(classnum);
	console.log(fieldnum);
	$("#fieldnum").html("")
	$.getJSON("<c:url value='/shopadmin/getfilter'/>",{classnum:classnum,fieldnum:fieldnum},function(data) {
		fieldnum / classnum
		for(var q=0; q<data.fieldlist.length; q++){
	      	var ft_num = data.fieldlist[q].ft_num;
	      	var ft_name = data.fieldlist[q].ft_name;
	      	$("#fieldnum").append(ft_name)
		      	console.log("ft_num : "+ft_num);
		      	console.log("ft_name : "+ft_name);
		    var carr = data.arr[q].arrr;   
	      	$("#fieldnum").append("<br>");
	      	for(var i=0; i<carr.length;i++){
	      		if(ft_num==1){						
	      			$("#fieldnum").append("<input type='radio' name='filterrdo' id='' value="+carr[i].fc_num+">"+carr[i].fc_name+"&nbsp;&nbsp;");
	      		}else{
	      			$("#fieldnum").append("<input type='checkbox' name='filterchk' id='' value="+carr[i].fc_num+">"+carr[i].fc_name+"&nbsp;&nbsp;");
	      		}
		      	console.log("data.arr[q].arr1[i].fc_num : "+carr[i].fc_num);
		      	console.log("data.arr[q].arr1[i].ft_num : "+carr[i].ft_num);
		      	console.log("data.arr[q].arr1[i].fc_name : "+carr[i].fc_name);
	      	}
	      	$("#fieldnum").append("<br>");
    	}
	})
} */
function handleFileSelect() 
{
    var files = document.getElementById('file1').files[0]; //파일 객체

    var reader = new FileReader();

         
    reader.onload = (function(theFile) 
    {
        return function(e) 
        {
            var img_view = ['<img src=" ', e.target.result, ' " title=" ', escape(theFile.name), ' " style="width:210px;height:200px;"/>'].join('');                
            document.getElementById('list').innerHTML = img_view;
        };
    })(files);
    reader.readAsDataURL(files);    
}

</script>
<form method="post" action="<c:url value='/shopadmin/insert'/>" enctype="multipart/form-data" name="frm" onsubmit="return aaa()">
	<table class="table table-striped" style="float:left; margin-left:300px; width: 1000px;">

		<thead>
			<tr>
				<th colspan="2" align="center">상품등록하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>항목선택</td>
				<td>
					<select id="classsel" onchange="select()">
						<option>선택하세요.</option>
					<c:forEach var="classvo" items="${classvo }">
						<option value="${classvo.classnum }">${classvo.name }</option>
						</c:forEach>
					</select>
					
				
					<select id="fieldsel"  name="fieldnum"> 
					<option>선택하세요.</option>
					</select>
			
				</td>
			</tr>
			<tr>
				<td><div id="classnum">필터선택</div></td>
				<td><div id="fieldnum">
					<c:forEach var="filtertype" items="${filtertype }">
						<h4>${filtertype.ft_name }</h4>
						<c:forEach var="filtercontent" items="${filtercontent }">
							<c:if test="${filtertype.ft_num==filtercontent.ft_num }">
								<c:choose>
									<c:when test="${filtertype.ft_num==1}">
										<input type='radio' name='filterrdo' id='' value="${filtercontent.fc_num }">${filtercontent.fc_name }&nbsp;&nbsp;
									</c:when>
									<c:otherwise>
										<input type='checkbox' name='filterchk' id='' value="${filtercontent.fc_num }">${filtercontent.fc_name }&nbsp;&nbsp;
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						<br /><br />
					</c:forEach>
				</div></td>
			</tr>
			<tr>
				<td>대표이미지</td>
				<td><input type="file" name="file1" id="file1" onchange="handleFileSelect()">
				<div id="list" style="size: 200px;"><img src=""  style="size:200px"></div>
				</td>
			</tr>
			<tr>
				<td>상세이미지</td>
				<td><input multiple="multiple" type="file" name="multifile" /> </td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="item_name"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>입고수량</td>
				<td><input type="text" name="stock"></td>
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
	<input type="hidden" id="content" name="content" />
</form>
<script type="text/javascript">
	function aaa(){
		$("#content").val($("#editor-one").html());
		return true;
	}
</script>



