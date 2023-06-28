<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="modal fade" id="annualAddModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">연차/휴가 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="ticket.regist" method="post">
					<div class="modal-body">
						<div class="mb-3">
							<label for="ticket-name" class="form-label">사번</label> <input
								type="text" class="form-control" id="annual_emp_no"
								name="emp_no">
						</div>
						<!-- 
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">직원명</label> <input
								type="text" class="form-control" id="annual_name" name="name"
								value="" readonly="readonly">
							</div>
							<div class="col-md-6 mb-3">
								<label for="branch-name" class="form-label">직급</label> <input
								type="text" class="form-control" id="annual_position"
								name="position" value="" readonly="readonly">
							</div>
						</div>
						 -->
						<div class="mb-3">
							<label for="ticket-type" class="form-label">구분</label> <select
								class="form-select" id="annual_type" name="annual_kind">
								<option selected value="none">연차/휴가 종류 선택</option>
								<option value="연차">연차</option>
								<option value="휴가">휴가</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="ticket-count" class="col-form-label">생성일수</label>
							<div class="input-group mb-3">
								<input type="number" id="annual_time" class="form-control"
									name="annual_time" placeholder="부여할 연차/휴가 일 수를 입력하세요"
									aria-describedby="basic-addon22"> <span
									class="input-group-text" id="basic-addon22">일</span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="annualAdd()">생성</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="annualDelModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">연차/휴가 소진</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					이용권을 삭제하시겠습니까?<br> 삭제한 이용권은 복구할 수 없습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" onclick="del()">차감</button>
				</div>
			</div>
		</div>
	</div>

	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>직원 연월차 리스트</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main">메인</a></li>
							<li class="breadcrumb-item active">직원 연월차 리스트</li>
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
							<div class="float-left" style="display: flex">
								<select class="form-select" aria-label="Default select example">
									<option selected>근무 기간</option>
									<option value="1">1년 미만</option>
									<option value="2">1년 이상</option>
									<option value="3">전체</option>
								</select>&nbsp; <select class="form-select"
									aria-label="Default select example">
									<option selected>출석률</option>
									<option value="1">지난달 근태 100%</option>
									<option value="2">작년 근태 80% 이상</option>
									<option value="3">전체</option>
								</select>
							</div>

							<div class="float-right">
								<a class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#annualAddModal" data-shuffle onclick="annualAddModal(event)"> 연차/휴가 생성 </a>&nbsp;<a
									class="btn btn-secondary" data-bs-toggle="modal"
									data-bs-target="#annualDelModal" data-shuffle> 연차/휴가 소진 </a>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">직원 연차/휴가 리스트</h4>
							</div>
							<div class="card-body">
								<c:if test="${annualList.size() > 0}">
									<table class="table">
										<thead class="table-light">
											<tr>
												<th>#</th>
												<th>사번</th>
												<th>직원명</th>
												<th>직급</th>
												<th>입사일</th>
												<th>근속연수</th>
												<th>작년근태</th>
												<th>지난달근태</th>
												<th>발생휴가</th>
												<th>차감휴가</th>
												<th>잔여휴가</th>
												<th>조회<th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${annualList}" var="dto" varStatus="status">
												<tr>
													<td><input class="form-check-input"
														style="margin-left: 0" type="checkbox"
														value="${dto.emp_no}"></td>
													<td>${dto.emp_no}</td>
													<td>${dto.name}</td>
													<td>${dto.position}</td>
													<td>${dto.join_year}</td>
													<td><fmt:formatNumber value="${dto.work_year/365}" pattern="0.000"/></td>
													<td></td>
													<td></td>
													<td>
														<c:if test="${empty dto.annualAdd}">0</c:if>
														<c:if test="${not empty dto.annualAdd}">${dto.annualAdd}</c:if>
													</td>
													<td>
														<c:if test="${empty dto.annualSub}">0</c:if>
														<c:if test="${not empty dto.annualSub}">${dto.annualSub}</c:if>
													</td>
													<td>${dto.annualAdd - dto.annualSub}</td>
													<td><button type="button" class="btn btn-secondary btn-sm">조회</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty annualList}">
									<div style="text-align: center;">검색되는 직원이 없습니다.</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
		
		</section>
	</div>
</body>
<script type="text/javascript">
var checkArr = [];
var evtCheck = 0;
const myModalEl = document.getElementById('annualAddModal')
myModalEl.addEventListener('shown.bs.modal', event => {
	console.log("활성화");
	if(checkArr.length == 0){
		evtCheck += 1
		failReload(evtCheck);
	}
})
function failReload(arg){
	if (arg==1){
		alert("최소 한 명 이상의 직원을 선택해주세요.");
		location.reload();
	}
}

	function annualAddModal(e) {
		checkArr = [];
		$('input[type="checkbox"]:checked').each(function(idx, item) {
			// each는 jquery에서 사용하는 foreach
			// checkbox에 value를 지정하지 않으면 기본값을 on으로 스스로 지정한다
			if ($(this).val() != 'on') {
				console.log(idx, $(this).val());
				checkArr.push($(this).val());
			}
		});
		console.log(checkArr);
		arrString = ""
		for(var i in checkArr){
			arrString = (i < checkArr.length-1) ? arrString + checkArr[i] + ", " : arrString + checkArr[i];
		}
		console.log(arrString);
		$("#annual_emp_no").val(arrString)
	}
	
	function annualAdd() {
		var aType = $("#annual_type").val();
		var aTime = $("#annual_time").val();
	
		if(aType != "" && aTime != ""){
			$.ajax({
				type : 'post',
				url : 'annual.add',
				data : {
					'addList' : checkArr,
					'annualType' : aType,
					'annualTime' : aTime
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.success) {
						alert("연차/휴가 부여에 성공했습니다.");
						location.reload();
					}
				},
				error : function(e) {
					alert("연차/휴가 부여에 실패했습니다.");
				}
			});
		} else {
			alert("필요 항목을 모두 선택 및 입력해주세요.")
		}
		
	}
</script>
</html>
