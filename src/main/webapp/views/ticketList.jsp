<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 관리</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<!-- Modal -->
	<div class="modal fade" id="ticketAddModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">이용권 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="row g-3"></form>
					<div class="mb-3">
						<label for="ticket-name" class="form-label">이용권 명</label> <input
							type="text" class="form-control" id="ticket-name">
					</div>
					<div class="mb-3">
						<label for="branch-name" class="form-label">지점</label> <input
							type="text" class="form-control" id="branch-name" value="${sessionScope.loginEmp.b_name}" readonly="readonly">
					</div>
					<div class="mb-3">
						<label for="ticket-type" class="form-label">종류</label> <select
							class="form-select" id="ticket-type">
							<option selected value="none">이용권 종류 선택</option>
							<option value="1">일반 회원권</option>
							<option value="2">PT 회원권</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="ticket-count" class="col-form-label">이용횟수</label>
						<div class="input-group mb-3">
							<input type="number" id="ticket-count" class="form-control"
								placeholder="이용권의 이용기한 또는 PT횟수를 입력하세요"
								aria-describedby="basic-addon2"> <span
								class="input-group-text" id="basic-addon2">개월</span>
						</div>
					</div>
					<div class="mb-3">
						<label for="ticket-price" class="col-form-label">가격</label>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon3">₩</span> <input
								type="text" id="ticket-price" class="form-control"
								placeholder="이용권의 가격을 입력하세요" aria-describedby="basic-addon3">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>

	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>이용권 관리</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">메인</a></li>
							<li class="breadcrumb-item active">이용권 관리</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div style="height: 50px">
							<div class="float-right">
								<a class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#ticketAddModal" data-shuffle> 이용권 등록 </a> <a
									class="btn btn-danger" href="javascript:void(0)" data-shuffle>
									이용권 삭제 </a>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">이용권 리스트</h4>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="table-light">
										<tr>
											<th>#</th>
											<th>번호</th>
											<th>이용권 명</th>
											<th>지점</th>
											<th>종류</th>
											<th>이용횟수</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input class="form-check-input"
												style="margin-left: 0" type="checkbox" id="" value="option1">
											</td>
											<td>1</td>
											<td>테스트</td>
											<td>서울점</td>
											<td>일반</td>
											<td>6개월</td>
											<td>160,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>
</body>
<script type="text/javascript">
$("#ticket-type").change(function () {
	$val = $("#ticket-type").val()
	console.log($val)
	if($val == 1){
		$("#basic-addon2").text("개월")
	}
	if($val == 2){
		$("#basic-addon2").text("회")
	}
})
</script>
</html>