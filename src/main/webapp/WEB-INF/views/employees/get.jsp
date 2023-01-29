<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<!--  -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees
		<button type="submit"  data-oper="modify" class="btn btn-success pull-right">수정</button>
		<button type="submit" data-oper="retire" class="btn btn-danger pull-right">퇴사</button>
		</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				직원 상세 조회
				
				<!-- <button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Board</button> -->
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!-- <form id="regForm" method="post" action="/employees/register"> -->
					<div class="panel-body">
					
						<div class="form-group">
							<label>#사번</label>
							<input class="form-control" 
								name="emp_no" value="<c:out value='${employee.emp_no}'/>" readonly="readonly">
						</div>
						
						<div class="row">
							<div class="col-xs-4">
								<div class="form-group">
									<label>이름</label> <input class="form-control"
										name="first_name" value="<c:out value='${employee.first_name}'/>" readonly="readonly">
								</div>
							</div>
							<div class="col-xs-3">
								<div class="form-group">
									<label>성</label> <input class="form-control"
										name="last_name" value="<c:out value='${employee.last_name}'/>" readonly="readonly">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>생년월일</label>
							<input class="form-control" type="date"
								name="birth_date" placeholder="yyyy-MM-dd" value='<fmt:formatDate value="${employee.birth_date}" pattern="yyyy-MM-dd" />'  readonly="readonly">
						</div>

						<div class="form-group">
							<label>성별</label>
							<div class="radio-inline">
								<label> <input type="radio" name="gender"
									id="optionsRadios1" value="M" ${(employee.gender eq 'M' )? "checked" : ""}   disabled>Male
								</label>
							</div>
							<div class="radio-inline">
								<label> <input type="radio" name="gender"
									id="optionsRadios2" value="F" ${(employee.gender eq 'F') ? "checked" : ""} disabled>Female
								</label>
							</div>

						</div>
						
						<div class="form-group">
							<label>입사일</label> <input class="form-control" type="date"
								name="hire_date" placeholder="yyyy-MM-dd" value='<fmt:formatDate value="${employee.hire_date}" pattern="yyyy-MM-dd" />'  readonly="readonly">
						</div>

						<div class="form-group">
                        	<label>퇴사일</label> <input class="form-control" type="date"
                                name="retire_date" placeholder="yyyy-MM-dd" value='<fmt:formatDate value="${employee.retire_date}" pattern="yyyy-MM-dd" />'  readonly="readonly">
                        </div>

						<div class="form-group">
							<div class="row">
								<div class="col-xs-5">
									<label>부서</label>
									<select class="form-control" name="dept_no" id="sel_department" disabled>
										<option value=""><c:out value='${employee.dept_name}'/></option>
									</select>
								</div>
								<div class="col-xs-5">
									<label>직급</label>
									<select class="form-control" name="title" id="sel_title" disabled>
										<option value=""><c:out value='${employee.title}'/></option>
									</select>
								</div>
							</div>
						</div>
<!-- 
						<button type="submit" class="btn btn-primary">Register</button>
						<button type="reset" class="btn btn-danger">Reset</button> 
-->
					</div>
				<!-- </form> -->
				
				<form id="operForm" action="/employees/modify" method="get">
					<input type="hidden" id="emp_no" name="emp_no" value='<c:out value="${employee.emp_no}" />'/>
					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}" />" />
				 	<input type="hidden" name="amount" value="<c:out value="${cri.amount}" />" />
				 	<input type="hidden" name="type" value="<c:out value="${cri.type}" />" />
					<input type="hidden" name="keyword" value="<c:out value="${cri.keyword}" />" />
				</form>

				<form id="empForm" action="/employees/retire" method="post">
				    <input type="hidden" id="emp_no" name="emp_no" value='<c:out value="${employee.emp_no}" />'/>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		
		
		<div class="panel panel-primary">
			<div class="panel-heading">
				Departments
				<!-- <button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Board</button> -->
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="departmentsTable">
						<thead>
							<tr>
								<th>#</th>
								<th>부서</th>
								<th>From_date</th>
								<th>To_date</th>
							</tr>
						</thead>
						<tbody>
							<!--  <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr> -->
						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
		</div>
		
		<div class="panel panel-primary">
			<div class="panel-heading">
				Titles
				<!-- <button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Board</button> -->
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="titlesTable">
						<thead>
							<tr>
								<th>#</th>
								<th>직급</th>
								<th>From_date</th>
								<th>To_date</th>
							</tr>
						</thead>
						<tbody>
							<!--  <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr> -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /.panel -->
	</div>
	
	<!-- /.col-lg-12 -->
</div>

<script type="text/javascript" src="/resources/js/dept.js?v=10"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				var emp_no = '<c:out value="${employee.emp_no}"/>';
				deptService.getDeptEmpList(emp_no, function(list) {
					console.log(list);
                	var str = '';
                	$(list).each(function(i, obj){
                		str += '<tr><td>' + (i+1) +
                		'</td><td>' + obj.dept_name +
                		'</td><td>' + deptService.displayTime(obj.from_date) +
                		'</td><td>' + deptService.displayTime(obj.to_date) +
                		'</td></tr>';
                	});
                	$('#departmentsTable tbody').html(str);
				});

				deptService.getTitleList(emp_no, function(list) {
					console.log(list);
					var str = '';
                	$(list).each(function(i, obj){
                		str += '<tr><td>' + (i+1) +
                		'</td><td>' + obj.title +
                		'</td><td>' + deptService.displayTime(obj.from_date) +
                		'</td><td>' + deptService.displayTime(obj.to_date) +
                		'</td></tr>';
                	});
                	$('#titlesTable tbody').html(str);
				});
				
				
				var operForm = $('#operForm');
                var retireForm = $('#empForm');

				$("button[data-oper='modify']").on("click", function(e){
					operForm.attr("action", "/employees/modify").submit();
				});
				$("button[data-oper='retire']").on("click", function(e) {
				    retireForm.attr("action", "/employees/retire").submit();
                });
			});
</script>
<!--  -->
<%@include file="../includes/footer.jsp"%>
