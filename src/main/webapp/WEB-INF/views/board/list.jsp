<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Board List Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">게시글 등록</button>
			</div>


			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="row">
					<form id="searchForm" action="/board/list" method="get">
						<div class="col-xs-2">
							<select class="form-control" name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null
							?'selected':''}" 
							/> >--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'
							?'selected':''}" 
							/> >제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C'
							?'selected':''}" 
							/> >작성자 사번</option>
							</select>
						</div>
						<div class="col-xs-2" style="padding: 0px;">
							<input class="form-control" type="text" name="keyword" 
								value="<c:out value='${pageMaker.cri.keyword}'/>" />
						</div>
						<div class="col-xs-2">
							<button class="btn btn-default">검색</button>
						</div>
						<input type="hidden" name="pageNum"
							value="<c:out value="${pageMaker.cri.pageNum}" />" /> <input
							type="hidden" name="amount"
							value="<c:out value="${pageMaker.cri.amount}" />" />
					</form>
				</div>

				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자 사번</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr class="odd gradeX">
									<td colspan="5">[없음]
								</tr>
							</c:when>

							<c:when test="${!empty list}">
								<c:forEach items="${list}" var="board">
									<tr class="odd gradeX">
										<td><c:out value="${board.b_no}" /></td>
										<td><a class="move" href="<c:out value="${board.b_no}" />">
												<c:out value="${board.title}" /> <b> [  <c:out value="${board.replyCnt}" />  ] </b>
										</a></td> 
										<td><c:out value="${board.emp_no}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.reg_date }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.update_date }" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>



				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage - 1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num?"active":""}">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>

				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum"
						value="<c:out value="${pageMaker.cri.pageNum}" />" /> 
					<input type="hidden" name="amount"
						value="<c:out value="${pageMaker.cri.amount}" />" />
					<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}" />" />
					<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}" />" />
				</form>


				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- MODAL 끝!!!!!!!!!!!!!!!!!!!!! -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<script type="text/javascript">
	$(document).ready(function() {
						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");

							}

							$("#myModal").modal("show");
						}

						$('#regBtn').on('click', function() {
							self.location = "/board/register";
						});

						var actionForm = $("#actionForm");
						$(".paginate_button a").on("click",
								function(e) {
									e.preventDefault();
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						

						
						
										$(".move").on("click", function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='b_no' value='"
															+ $(this).attr(
																	"href")
															+ "'/>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();
										});
						
						var searchForm = $('#searchForm');
						$('#searchForm button').on("click", function(e){
							if(!searchForm.find("option:selected").val()){
								alert("검색종류를 선택하세요.");
								return false;
							}
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력하세요.");
								return false;	
							}
							searchForm
							.find("input[name='pageNum']").val("1");
							e.preventDefault();
							searchForm.submit();
						});
						

					});
</script>

<%@include file="../includes/footer.jsp"%>







