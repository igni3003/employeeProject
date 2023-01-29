<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상세 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Page</div>
			<div class="panel-body">

				<div class="form-group">
					<label>#번호</label>
					<input class="form-control" name="b_no" value="<c:out value='${board.b_no}'/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" value="<c:out value='${board.title}'/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value='${board.content}' />
						</textarea>
				</div>
				<div class="form-group">
					<label>작성자 사번</label>
					<input class="form-control" name="emp_no" value="<c:out value='${board.emp_no}'/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>작성일</label>
					<input class="form-control" name="reg_date" value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.reg_date }" />" readonly="readonly">
				</div>
				<div class="form-group">
					<label>수정일</label>
					<input class="form-control" name="update_date" value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.update_date }" />" readonly="readonly">
				</div>
				
				<button data-oper="modify" class="btn btn-default">수정</button>
				<button data-oper="list" class="btn btn-info">목록</button>
				
				<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="b_no" name="b_no" value='<c:out value="${board.b_no}" />'/>
					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}" />" />
				 	<input type="hidden" name="amount" value="<c:out value="${cri.amount}" />" />
				 	<input type="hidden" name="type" value="<c:out value="${cri.type}" />" />
					<input type="hidden" name="keyword" value="<c:out value="${cri.keyword}" />" />
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>


<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Files</div>
			<!-- /.panel-heading -->
			<div class="panel-body">


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

<div class='row'>
   <div class="col-lg-12">
      <!-- /.panel -->
      <div class="panel panel-default">
         <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i> 댓글
            <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 등록</button>
         </div>

         <!-- /.panel-heading -->
         <div class="panel-body">

            <ul class="chat">
               
            </ul>
            <!-- ./ end ul -->
         </div>
         <!— /.panel .chat-panel —>
         <div class="panel-footer">
         	
         </div>
      </div>
   </div>
   <!— ./ end row —>
</div>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글 등록</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글</label> <input class="form-control" name='reply'
						value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>작성자 사번</label> <input class="form-control" name='emp_no'
						value='emp_no'>
				</div>
				<div class="form-group">
					<label>댓글 등록일</label> <input class="form-control"
						name='reply_date' value='2018-01-01 13:13'>
				</div>

			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
		<!— /.modal-content —>
	</div>
	<!— /.modal-dsialog —>
</div>
<!— /.modal —>
<script type="text/javascript" src="/resources/js/reply.js?v=15"></script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("===================");
		var bnoValue = '<c:out value='${board.b_no}'/>';
		
		var replyUL = $(".chat");
		
		var pageNum = 1;
		// panel-footer
		var replyPageFooter = $(".panel-footer");
		
		showList(1);
		
		function showList(page){
			replyService.getList(
				{b_no:bnoValue, page:page},
				function(replyCnt, list){
					
					console.log("replyCnt : " + replyCnt);
					console.log("list : " + list);
					
					if(page == -1){
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
					}
					
					var str = "";
					if(list == null || list.length == 0){
						replyUL.html("");
						return;
					}
					for(var i=0, len=list.length || 0; i < len; i++){
						str +="<li class='left clearfix' data-r_no='"+list[i].r_no+"'>";
						str +="<div><div class='header'><strong class='primary-font'>"+list[i].emp_no+"</strong>";
						str +="<small class='pull-right text-muted'>"
	                         + replyService.displayTime(list[i].reply_date) +"</small></div>";
						str +="<p>"+list[i].reply+"</p></div></li>";
					}
					replyUL.html(str);
					showReplyPage(replyCnt);
				});
			
		} // showList end.
		
		function showReplyPage(replyCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			// pageNum : 820 
			// endNum : 819
			if(endNum < pageNum){
				pageNum = endNum;
			}
			
			var str = "<ul class='pagination pull-right'>";
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li> "; 
			}
			
			for(var i = startNum; i <= endNum; i++){
				var active = (pageNum == i)?"active":"";
				str += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li> "; 
			}
			
			str += "</ul>";
			
			console.log(str);
			
			replyPageFooter.html(str);
			
		} // show reply page
		
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		var modal = $(".modal");
		var modalInputReply
		= modal.find("input[name='reply']");
		var modalInputempNo
		= modal.find("input[name='emp_no']");
		var modalInputReplyDate
		= modal.find("input[name='reply_date']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modalInputempNo.removeAttr("readonly");
			modalInputReplyDate.closest("div").hide(); //.show();
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalRegisterBtn.show();
			$(".modal").modal("show");
			
		});
		
		modalRegisterBtn.on("click", function(e){
			var reply = {
				reply: modalInputReply.val(),
				emp_no: modalInputempNo.val(),
				b_no: bnoValue
			};
			replyService.add(reply, function(result){
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(-1);
			});
		});
		
		$('#modalCloseBtn').on("click", function(e){
			modal.find("input").val("");
			modal.modal("hide");
		});
		
		//UL
		$(".chat").on("click", "li", function(e){
			var r_no = $(this).data("r_no");
			console.log("r_no :" + r_no);
			replyService.get(r_no, function(reply){
				modalInputReply.val(reply.reply);
				modalInputempNo.val(reply.emp_no)
				.attr("readonly", "readonly");
				modalInputReplyDate.closest("div").show();
				modalInputReplyDate
				.val(replyService.displayTime(reply.reply_date))
				.attr("readonly", "readonly");
				
				modal.data("r_no", reply.r_no);
			
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$('.modal').modal("show");
			});

		});
		
		modalModBtn.on("click", function(e){
			var reply = {
				r_no : modal.data("r_no"),
				reply : modalInputReply.val()
			};
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var r_no = modal.data("r_no");
			replyService.remove(r_no, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
	}); // END : $(document).ready 
</script>

<script type="text/javascript">
	$(document).ready(function() {
		
		var operForm = $('#operForm');
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#b_no").remove();
			operForm.attr("action", "/board/list").submit();
		});
		
		 
	});
</script>

<script>
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value="${board.b_no}" />';
			console.log(bno);
			$.getJSON("/board/getAttachList", {b_no:bno}, function(arr){
			    console.log(arr);
				var str = "";
				       
				$(arr).each(function(i, attach){
				//image type
			       if(attach.fileType){
			          var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);       
			          str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			          str += "<img src='/display?fileName="+fileCallPath+"'>";
			          str += "</div>";
			          str +"</li>";
			        }else{
			          str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			          str += "<span> "+ attach.fileName+"</span><br/>";
			          str += "<img src='/resources/img/attach.png'></a>";
			          str += "</div>";
			          str +"</li>";
			        }
				});
		        $(".uploadResult ul").html(str);
		         
			});
		})();
		
		$(".uploadResult").on("click", "li", function(e){
			console.log("view image");
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path") + "/"
					+liObj.data("uuid") + "_"
					+liObj.data("filename"));
			if(liObj.data("type")){
				showImage(path);
			}else{
				self.location = "/download?fileName="+path;
			}
		}); // upliadResult li click end
		
		function showImage(fileCallPath){
			alert(fileCallPath);
			$(".bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture")
			.html("<img src='/display?fileName="+fileCallPath+"'>")
			.animate({width:'100%', height:'100%'}, 1000);
		}
		
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture")
			.animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function(){
				$(".bigPictureWrapper").hide();
			}, 1000);
		});
		
	});
</script>



<%@include file="../includes/footer.jsp"%>