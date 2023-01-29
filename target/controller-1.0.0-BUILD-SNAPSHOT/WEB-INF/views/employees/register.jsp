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
				employees Register Page
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
									<label>First Name</label> <input class="form-control"
										name="first_name" placeholder="First Name">
								</div>
							</div>
							<div class="col-xs-3">
								<div class="form-group">
									<label>Last Name</label> <input class="form-control"
										name="last_name" placeholder="Last Name">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Birth Date</label> <input class="form-control"
								name="birth_date" placeholder="yyyy-MM-dd">
						</div>

						<div class="form-group">
							<label>Gender</label>
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
							<label>Hire Date</label> <input class="form-control"
								name="hire_date" placeholder="yyyy-MM-dd">
						</div>

						<button type="submit" class="btn btn-primary">Register</button>
						<button type="reset" class="btn btn-danger">Reset</button>
					</div>
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
		var regForm = $('#regForm');
		$("#regForm .btn-primary").on("click", function(e){
			e.preventDefault();
			if(!regForm.find("input[name='first_name']").val()){
				alert("First Name!");
				return false;
			}
			if(!regForm.find("input[name='last_name']").val()){
				alert("Last Name!");
				return false;
			}
			if(!regForm.find("input[name='birth_date']").val()){
				alert("Birth Date!");
				return false;
			}
			if(!regForm.find("input[name='hire_date']").val()){
				alert("Hire Date!");
				return false;
			}
			regForm.submit();
			
		});
		
	});
	
</script>
<!--  -->
<%@include file="../includes/footer.jsp"%>
