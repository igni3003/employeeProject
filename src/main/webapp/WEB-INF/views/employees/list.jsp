<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				직원 리스트
				<!-- <button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Board</button> -->
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="row">
					<form id="searchForm" action="/employees/list" method="get">
						<div class="col-xs-2">
							<select class="form-control" name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}" />>-</option>
								<option value="E" <c:out value="${pageMaker.cri.type eq 'E'?'selected':''}" />>#사번</option>
								<option value="D" <c:out value="${pageMaker.cri.type eq 'D'?'selected':''}" />>부서</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}" />>직책</option>
								<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}" />>이름</option> 
							</select>
						</div>
						<div class="col-xs-2" style="padding: 0px;">
							<input class="form-control" type="text" name="keyword" 
								value="<c:out value='${pageMaker.cri.keyword}'/>" />
						</div>
						<div class="col-xs-2">
							<button class="btn btn-default"><p class="fa fa-search" style="margin:0px;" /> 검색</button>
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
							<th>#사번</th>
							<th>부서</th>
							<th>직책</th>
							<th>성별</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>입사일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="emp">
							<tr class="odd gradeX">
								<td>
									<a class="move" href="<c:out value="${emp.emp_no}" />">
										<c:out value="${emp.emp_no}" />
									</a>
								</td>
								<td><c:out value="${emp.dept_name}" /></td>
								<td><c:out value="${emp.title}" /></td>
								<td><c:choose>
										<c:when test="${emp.gender eq 'M'}">
											남자
										</c:when>
										<c:otherwise>
											여자
										</c:otherwise>
									</c:choose></td>
								<td><c:out value="${emp.last_name} ${emp.first_name}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${emp.birth_date }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${emp.hire_date }" /></td>
							</tr>
						</c:forEach>
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
				<form id="actionForm" action="/employees/list" method="get">
					<input type="hidden" name="pageNum"
						value="<c:out value="${pageMaker.cri.pageNum}" />" /> 
					<input type="hidden" name="amount"
						value="<c:out value="${pageMaker.cri.amount}" />" />
					<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}" />" />
					<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}" />" />
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
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
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='emp_no' value='"
							+ $(this).attr("href")
							+ "'/>");
			actionForm.attr("action","/employees/get");
			actionForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>







