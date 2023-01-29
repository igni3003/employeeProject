<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
.bigPicture img {
	width:500px;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify Page</div>
			<div class="panel-body">
				<form action="/board/modify" method="post">
				
					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}" />" />
				 	<input type="hidden" name="amount" value="<c:out value="${cri.amount}" />" />
				 	<input type="hidden" name="type" value="<c:out value="${cri.type}" />" />
					<input type="hidden" name="keyword" value="<c:out value="${cri.keyword}" />" />
					
					<div class="form-group">
						<label>bno</label> <input class="form-control" name="b_no"
							value="<c:out value='${board.b_no}'/>" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value="<c:out value='${board.title}'/>">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="3" name="content"><c:out
								value='${board.content}' />
							</textarea>
					</div>
					<div class="form-group">
						<label>작성자 사번</label> <input class="form-control" name="emp_no"
							value="<c:out value='${board.emp_no}'/>" readonly="readonly">
					</div>
					<div class="form-group" hidden>
						<label>작성일</label> <input class="form-control" name="reg_date"
							value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.reg_date}" />"
							readonly="readonly">
					</div>
					<div class="form-group" hidden>
						<label>수정일</label> <input class="form-control" name="update_date"
							value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.update_date}" />"
							readonly="readonly">
					</div>

					<!-- data-* -->
					<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
					<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
					<button type="submit" data-oper="list" class="btn btn-info">List</button>
					
					
					
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Files</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<div class="form-group uploadDiv">
		            <input type="file" name='uploadFile' multiple>
		        </div>
		        
				<div class='uploadResult'>
					<ul>
	
					</ul>
				</div>
			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>

<!-- /.row -->
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		
		$('button').on('click', function(e) {
			e.preventDefault();
			
			var operation = $(this).data("oper"); //
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			}else if(operation === 'list'){
				formObj
				.attr("action", "/board/list")
				.attr("method", "get");
				var pageNumTag =  $("input[name='pageNum']").clone();
				var amountTag =  $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}else if(operation === 'modify'){
				
				console.log("submit clicked");
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				});
				
				formObj.append(str);
				
			}
			
			formObj.submit();
			
		});
		
	});
</script>

<script>
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value="${board.b_no}" />';
			console.log(bno);
			$.getJSON("/board/getAttachList", {b_no:bno}, function(arr){
				var str = "";
				// p.586       
				$(arr).each(function(i, attach){
					//image type
			       if(attach.fileType){
			          var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);       
			          str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			          str += "<span> "+ attach.fileName+"</span>";
				      str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/display?fileName="+fileCallPath+"'>";
			          str += "</div>";
			          str +"</li>";
			        }else{
			          var fileCallPath =  encodeURIComponent( attach.uploadPath+"/"+ attach.uuid +"_"+attach.fileName);
			          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			          str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			          str += "<span> "+ attach.fileName+"</span><br/>";
					  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>" 
			          str += "<img src='/resources/img/attach.png'></a>";
			          str += "</div>";
			          str +"</li>";
			        }
				});
		        $(".uploadResult ul").html(str);    
			});
	})();
		
	$(".uploadResult").on("click", "button", function(e){
		console.log("click!!!");
		if(confirm("Remove this file?")){
			console.log("OK!");
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	}); // .uploadResult click button end
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	  
	function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    return true;
	}
	  
	$("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/uploadAjaxAction',
	      processData: false, 
	      contentType: false,
	      data: formData,
	      type: 'POST',
	      dataType:'json',
	      success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 
	      }
	    }); //$.ajax
	    
	  });    

	  function showUploadResult(uploadResultArr){
		    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
			
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}
	    });
	    uploadUL.append(str);
	  }	
});
</script>

<%@include file="../includes/footer.jsp"%>