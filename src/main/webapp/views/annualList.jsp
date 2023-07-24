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
<script src="plugins/pagination/jquery.twbsPagination.js" type="text/javascript"></script>
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
								<option selected value="">연차/휴가 종류 선택</option>
								<option value="연차">연차</option>
								<option value="휴가">휴가</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="ticket-count" class="col-form-label">생성일수</label>
							<div class="input-group mb-3">
								<input type="number" id="annual_time" class="form-control"
									name="annual_time" placeholder="부여할 연차/휴가 일 수를 입력하세요"
									aria-describedby="basic-addon"> <span
									class="input-group-text" id="basic-addon">일</span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="annualAdd()">생성</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="annualSubModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">연차/휴가 소진</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="ticket.regist" method="post">
					<div class="modal-body">
						<div class="mb-3">
							<label for="ticket-name" class="form-label">사번</label> <input
								type="text" class="form-control" id="annual_emp_no_sub"
								name="emp_no_sub">
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
								class="form-select" id="annual_type_sub" name="annual_kind_sub">
								<option selected value="none">연차/휴가 종류 선택</option>
								<option value="연차">연차</option>
								<option value="오전반차">오전반차</option>
								<option value="오후반차">오후반차</option>
								<option value="휴가">휴가</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="ticket-count" class="col-form-label">차감일수</label>
							<div class="input-group mb-3">
								<input type="number" id="annual_time_sub" class="form-control"
									name="annual_time_sub" placeholder="부여할 연차/휴가 일 수를 입력하세요"
									aria-describedby="basic-addon2"> <span
									class="input-group-text" id="basic-addon2">일</span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary"
							onclick="annualSub()">차감</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="annualDetailModal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">연차/휴가 상세보기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="detail_emp_no">사번</label> <input type="text"
								class="form-control" id="detail_emp_no" value="12345678"
								readonly="readonly">
						</div>
						<div class="col-md-4 mb-3">
							<label for="detail_name">직원명</label> <input type="text"
								class="form-control" id="detail_name" value="이근일"
								readonly="readonly">
						</div>
						<div class="col-md-4 mb-3">
							<label for="detail_position">직급</label> <input type="text"
								class="form-control" id="detail_position" value="트레이너"
								readonly="readonly">
						</div>
					</div>
					<select class="form-select" aria-label="Default select example"
						id="detail_selected">
						<option value="연차">연차</option>
						<option value="휴가">휴가</option>
					</select> <br> <br>
					<table class="table">
						<thead>
							<tr style="text-align: center;" id="detail_list_header">
								<th>생성연월차</th>
								<th>사용연월차</th>
								<th>잔여연월차</th>
							</tr>
						</thead>
						<tbody>
							<tr style="text-align: center; font-size: 16pt">
								<td id="detail_annual_add">0</td>
								<td id="detail_annual_sub">0</td>
								<td id="detail_annual_sum">0</td>
							</tr>
						</tbody>
					</table>
					<br>
					<div style="text-align: center; font-size: 18px; font-weight: 600">지급/사용
						이력</div>
					<table class="table">
						<thead>
							<tr>
								<th>지급/사용</th>
								<th>처리일</th>
								<th>분류</th>
								<th>일수</th>
							</tr>
						</thead>
						<tbody id="detail_list">
							<tr>
								<td colspan="4">확인되는 이력이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
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
						<!-- <ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main">메인</a></li>
							<li class="breadcrumb-item active">직원 연월차 리스트</li>
						</ol> -->
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
								<select class="form-select" id="pagePerNum" style="width: 70px; height: 38px">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
								</select>&nbsp; <select class="form-select" id="sorting"
									style="width: 120px; height: 38px">
									<option value="desc">내림차순</option>
									<option value="asc">오름차순</option>
								</select>&nbsp; <select class="form-select" id="sortingBranch"
									style="width: auto; display: none; height: 38px">
								</select>&nbsp; <select class="form-select" id="filter_work_year" style="height: 38px">
									<option value="3" selected>전체</option>
									<option value="1">1년 미만</option>
									<option value="2">1년 이상</option>
								</select>&nbsp;
								<!-- <select class="form-select" id="filter_attendance_rate">
									<option selected>출석률</option>
									<option value="1">지난달 근태 100%</option>
									<option value="2">작년 근태 80% 이상</option>
									<option value="3">전체</option>
								</select> -->
							</div>

							<div class="float-right">
								<a class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#annualAddModal" data-shuffle
									onclick="annualAddModal(event)"> 연차/휴가 생성 </a>&nbsp;&nbsp;<a
									class="btn btn-secondary" data-bs-toggle="modal"
									data-bs-target="#annualSubModal" data-shuffle
									onclick="annualSubModal(event)"> 연차/휴가 소진 </a>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">직원 연차/휴가 리스트</h4>
							</div>
							<div class="card-body" id="annual-card-body">
								<table class="table table-hover">
									<thead class="table-light">
										<tr>
											<th>#</th>
											<th>사번</th>
											<th>직원명</th>
											<th>지점</th>
											<th>직급</th>
											<th>입사일</th>
											<th>근속연수</th>
											<th>발생휴가</th>
											<th>차감휴가</th>
											<th>잔여휴가</th>
											<th>조회</th>
										</tr>
									</thead>
									<tbody id="empAnnualList">
										<tr>
											<th colspan="11"></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 	플러그인 사용	(twbsPagination)	-->
						<div class="container">									
							<nav aria-label="Page navigation" style="text-align:center; margin:0 auto">
								<ul class="pagination" id="pagination" style="text-align:center; margin:0 auto; justify-content: center; align-items: center;"></ul>
							</nav>		
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
	console.log("annualList Page loaded.")
	var checkArr = [];
	var evtCheck = 0;
	var showPage = 1;
	const myModalEl = document.getElementById('annualAddModal')
	const myModalEl2 = document.getElementById('annualSubModal')
	myModalEl.addEventListener('shown.bs.modal', event => {
		console.log("활성화");
		if(checkArr.length == 0){
			evtCheck += 1
			failReload(evtCheck);
		}
	})
	myModalEl2.addEventListener('shown.bs.modal', event => {
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
	$("#detail_selected").change(function() {
		$val = $("#detail_selected").val();
		console.log($val);
		if ($val == "연차") {
			$("#detail_list_header").html("<th>생성연월차</th><th>사용연월차</th><th>잔여연월차</th>");
		}
		if ($val == "휴가") {
			$("#detail_list_header").html("<th>생성휴가</th><th>사용휴가</th><th>잔여휴가</th>");
		}
		annualDetailList();
	});
	
	$('#pagePerNum').change(function() {
		paging();
	});

	$('#sorting').change(function() {
		paging();
	});

	$('#sortingBranch').change(function() {
		paging();
	});
	
	$("#filter_work_year").change(function() {
		paging();
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    console.log("페이지 로딩 완료!");
	    $.ajax({
			type:'post',
			url:'ticketBranchList.ajax',
			data:{},
			dataType:'json',
			success: function (data) {
				$('#sortingBranch').empty();
				data.forEach(function(dto,idx){
					if (dto.b_idx == "${sessionScope.loginEmp.b_idx}"){
						$('#sortingBranch').append('<option value="'+dto.b_idx+'" selected>'+dto.b_name+'</option>');
					} else {
						$('#sortingBranch').append('<option value="'+dto.b_idx+'">'+dto.b_name+'</option>');
					}
				});
				if ("대표" == "${sessionScope.loginEmp.position}"){
					$('#sortingBranch').css("display", "block");
				}
				paging();
				//listCall(showPage);
			},
			error: function (e) {
				console.log(e);
			}
		})
	  });
	
	function paging(){
		listCall(showPage);
		$('#pagination').twbsPagination('destroy');
	}
	
	function listCall(page){
		$.ajax({
			type : 'post',
			url : 'annualList.filter',
			data : {
				'page': page,
				'cnt': $('#pagePerNum').val(),
				'sort': $('#sorting').val(),
				'branch': $('#sortingBranch').val(),
				'filter_work_year' : $("#filter_work_year").val()
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				listPrint(data.list);
				
				// paging plugin 처리
				$('#pagination').twbsPagination({
					startPage: data.currPage,
					totalPages: data.pages,
					visiblePages: 5,
					onPageClick: function(event,page){ // 페이지 클릭 시 동작되는 함수
						console.log(event, page, showPage);
						if(page!=showPage){
							listCall(page);
							showPage = page;
						}
					}
				});
				
			},
			error : function(e) {
				alert("필터링 작업중 오류가 발생했습니다.");
			}
		});
	}
	
	function listPrint(data){
		var n = data.length;
		console.log(n);
		console.log("필터링 성공.");
		var content = '';
		if(n > 0){
			data.forEach(function(dto, index){
				console.log(index);
				content += '<tr>' +
					'<td><input class="form-check-input"' +
						'style="margin-left: 0" type="checkbox"' +
						'value="' + dto.emp_no + '"></td>';
				content += '<td>' + dto.emp_no + '</td>';
				content += '<td>' + dto.name + '</td>';
				content += '<td>' + dto.b_name + '</td>';
				content += '<td>' + dto.position + '</td>';
				content += '<td>' + dto.join_year + '</td>';
				content += '<td>' + (dto.work_year/365).toFixed(3) + '</td>';
				/* content += '<td></td><td></td>'; */
				content += '<td>';
				if(dto.annualAdd == null){
					content += '0';
				} else{
					content += dto.annualAdd;
				}
				content += '</td>' +
					'<td>';
				if(dto.annualSub == null){
					content += '0';
				} else{
					content += dto.annualSub;
				}
				content += '</td><td>';
				if(dto.annualAdd != null){
					if(dto.annualSub != null){
						content += dto.annualAdd - dto.annualSub;
					} else {
						content += dto.annualAdd;
					}
				} else {
					content += "0";
				}
				content += '</td><td><button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal"' +
								'data-bs-target="#annualDetailModal" data-shuffle onclick="annualDetail(\'' +dto.emp_no + '\', \'' +dto.name + '\', \'' + dto.position + '\')">조회</button>' +
					'</td>' +
				'</tr>';
			});
			$("#empAnnualList").empty();
			$("#empAnnualList").append(content);
		}
		else {
			$("#empAnnualList").empty();
			$("#empAnnualList").html('<tr><td colspan="11" style="text-align:center">검색되는 직원이 없습니다.</td><tr>');
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
	
	function annualSubModal(e) {
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
		$("#annual_emp_no_sub").val(arrString)
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
			alert("필요 항목을 모두 선택 및 입력해주세요.");
		}
	}
	function annualSub() {
		var aType = $("#annual_type_sub").val();
		var aTime = $("#annual_time_sub").val();
	
		if(aType != "" && aTime != ""){
			$.ajax({
				type : 'post',
				url : 'annual.sub',
				data : {
					'subList' : checkArr,
					'annualType' : aType,
					'annualTime' : aTime
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.success) {
						alert("연차/휴가 차감에 성공했습니다.");
						location.reload();
					}
				},
				error : function(e) {
					alert("연차/휴가 차감에 실패했습니다.");
				}
			});
		} else {
			alert("필요 항목을 모두 선택 및 입력해주세요.")
		}
	}
	function annualDetail(emp_no, name, position) {
		$("#detail_emp_no").val(emp_no);
		$("#detail_name").val(name);
		$("#detail_position").val(position);
		
		annualDetailList();
	}
	
	function annualDetailList(){
		console.log('annualDetailList');
		$no = $("#detail_emp_no").val()
		$type = $("#detail_selected").val();
		
		$.ajax({
			type : 'post',
			url : 'annual.detail',
			data : {
				'emp_no' : $no,
				'annual_type' : $type
			},
			dataType : 'json',
			success : function(data) {
				var add = 0
				var sub = 0
				if(data.annualDetailMap){
					var add = (data.annualDetailMap.annual_add) ? data.annualDetailMap.annual_add : 0;
					var sub = (data.annualDetailMap.annual_sub) ? data.annualDetailMap.annual_sub : 0;
					console.log(data.annualDetailMap);
				}
				$("#detail_annual_add").text(add);
				$("#detail_annual_sub").text(sub);
				$("#detail_annual_sum").text(add-sub);
				
				if(data.annualDetailList.length > 0){
					console.log(data.annualDetailList);
					var content = "";
					data.annualDetailList.forEach(function(item, index){
						if(item.annual_modifier == 1){
							content += "<tr><td>" + "<button type='button' class='btn btn-primary btn-sm' disabled>지급</button>" + "</td>";
						}else{
							content += "<tr><td>" + "<button type='button' class='btn btn-secondary btn-sm' disabled>사용</button>" + "</td>";
						}
						content += "<td>" + item.annual_date.substring(0,10) + "</td>";
						content += "<td>" + item.annual_kind + "</td>";
						content += "<td>" + item.annual_time + "</td></tr>";
					});
					$("#detail_list").empty();
					$("#detail_list").append(content);
				} else {
					$("#detail_list").empty();
					$("#detail_list").append("<tr><td colspan='4' style='text-align:center'>조회되는 이력이 없습니다.</td></tr>");
				}
			},
			error : function(e) {
				alert("데이터를 불러오는데 실패했습니다.");
			}
		});
	}
</script>
</html>

