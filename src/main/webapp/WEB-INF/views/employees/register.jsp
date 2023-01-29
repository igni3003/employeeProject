<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<!--  -->

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				직원 등록
				<!-- <button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Board</button> -->
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form id="regForm" method="post" action="/employees/register">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-4">
								<div class="form-group">
									<label>이름</label> <input class="form-control"
										name="first_name" placeholder="First Name">
								</div>
							</div>
							<div class="col-xs-3">
								<div class="form-group">
									<label>성</label> <input class="form-control"
										name="last_name" placeholder="Last Name">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>생년월일</label>
							<input class="form-control" type="date"
								name="birth_date" placeholder="yyyy-MM-dd">
						</div>

						<div class="form-group">
							<label>성별</label>
							<div class="radio-inline">
								<label> <input type="radio" name="gender"
									id="optionsRadios1" value="M" checked="">Male
								</label>
							</div>
							<div class="radio-inline">
								<label> <input type="radio" name="gender"
									id="optionsRadios2" value="F">Female
								</label>
							</div>

						</div>
						<div class="form-group">
							<label>입사일</label> <input class="form-control" type="date"
								name="hire_date" placeholder="yyyy-MM-dd">
						</div>
						
						<div class="form-group">
							<div class="row">
								<div class="col-xs-3">
									<label>부서</label>
									<select class="form-control" name="dept_no" id="sel_department">
										<option value="">--</option>
									</select>
								</div>
								<div class="col-xs-3">
									<label>직급</label>
									<select class="form-control" name="title" id="sel_title">
										<option value="">--</option>
									</select>
								</div>
							</div>
						</div>

						<button type="submit" class="btn btn-primary">등록</button>
						<button type="reset" class="btn btn-danger">초기화</button>
					</div>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<script type="text/javascript" src="/resources/js/dept.js?v=3"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var selDept = $('#sel_department');
		var selDeptTitle = $('#sel_title');
		
		deptService.getDeptList(function(list){
			showDeptList(list);	
		});
		
		selDept.on("change", function(e){
			var dept_no = $(this).val();
			if(dept_no == "" || dept_no == null) return;
			deptService.getDeptTitleList(dept_no, function(list){
				showDeptTitleList(list);
			});
		});
		
		function showDeptList(list){
			var str = "<option value=''>--</option>";
			list.forEach(d => {
				str += "<option value='"+d.dept_no+"'>"+d.dept_name+"</option>";
			});
			selDept.html(str);
		}
		
		function showDeptTitleList(list){
			var str = "<option value=''>--</option>";
			list.forEach(d => {
				str += "<option value='"+d.title+"'>"+d.title+"</option>";
			});
			selDeptTitle.html(str);
		}

	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $('#regForm');
		$("#regForm .btn-primary").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='first_name']").val()) {
				alert("First Name!");
				return false;
			}
			if (!regForm.find("input[name='last_name']").val()) {
				alert("Last Name!");
				return false;
			}
			if (!regForm.find("input[name='birth_date']").val()) {
				alert("Birth Date!");
				return false;
			}
			if (!regForm.find("input[name='hire_date']").val()) {
				alert("Hire Date!");
				return false;
			}
			if(!regForm.find("select[name='dept_no']").val()){
				alert("Department!.");
				return false;
			}
			if(!regForm.find("select[name='title']").val()){
				alert("Title!.");
				return false;
			}
			regForm.submit();
		});

	});
</script>
<!--  -->
<%@include file="../includes/footer.jsp"%>
