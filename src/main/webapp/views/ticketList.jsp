<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<form action="ticket.regist" method="post">
					<div class="modal-body">
						<div class="mb-3">
							<label for="ticket-name" class="form-label">이용권 명</label> <input
								type="text" class="form-control" id="ticket_name"
								name="ticket_name">
						</div>
						<div class="mb-3">
							<label for="branch-name" class="form-label">지점</label> <input
								type="text" class="form-control" id="branch_name" name="b_name"
								value="${sessionScope.loginEmp.b_name}" readonly="readonly"><input
								type="text" class="form-control" id="branch_idx" name="b_idx"
								value="${sessionScope.loginEmp.b_idx}" readonly="readonly"
								hidden="1">
						</div>
						<div class="mb-3">
							<label for="ticket-type" class="form-label">종류</label> <select
								class="form-select" id="ticket-type" name="ticket_type">
								<option selected value="none">이용권 종류 선택</option>
								<option value="일반">일반 회원권</option>
								<option value="pt">PT 회원권</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="ticket-count" class="col-form-label">이용횟수</label>
							<div class="input-group mb-3">
								<input type="number" id="ticket-count" class="form-control"
									name="ticket_time" placeholder="이용권의 이용기한 또는 PT횟수를 입력하세요"
									aria-describedby="basic-addon2"> <span
									class="input-group-text" id="basic-addon2">개월</span>
							</div>
						</div>
						<div class="mb-3">
							<label for="ticket-price" class="col-form-label">가격</label>
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon3">₩</span> <input
									type="text" id="ticket-price" class="form-control"
									name="ticket_price" placeholder="이용권의 가격을 입력하세요"
									aria-describedby="basic-addon3">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="add()">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="ticketModModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">이용권 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="ticket.modify" method="post">
					<div class="modal-body">
						<div class="mb-3">
							<label for="ticket-name" class="form-label">이용권 명</label> <input
								type="text" class="form-control" id="mticket_name"
								name="ticket_name"><input type="text"
								class="form-control" id="mticket_no" name="ticket_no" hidden="1">
						</div>
						<div class="mb-3">
							<label for="branch-name" class="form-label">지점</label> <input
								type="text" class="form-control" id="mbranch_name" name="b_name"
								value="" readonly="readonly"><input type="text"
								class="form-control" id="mbranch_idx" name="b_idx" value=""
								readonly="readonly" hidden="1">
						</div>
						<div class="mb-3">
							<label for="ticket-type" class="form-label">종류</label> <select
								class="form-select" id="mticket_type" name="ticket_type">
								<option selected value="none">이용권 종류 선택</option>
								<option value="일반">일반 회원권</option>
								<option value="pt">PT 회원권</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="ticket-count" class="col-form-label">이용횟수</label>
							<div class="input-group mb-3">
								<input type="number" id="mticket_count" class="form-control"
									name="ticket_time" placeholder="이용권의 이용기한 또는 PT횟수를 입력하세요"
									aria-describedby="basic-addon22"> <span
									class="input-group-text" id="basic-addon22">개월</span>
							</div>
						</div>
						<div class="mb-3">
							<label for="ticket-price" class="col-form-label">가격</label>
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon23">₩</span> <input
									type="text" id="mticket_price" class="form-control"
									name="ticket_price" placeholder="이용권의 가격을 입력하세요"
									aria-describedby="basic-addon23">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="mod()">변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="ticketDelModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">이용권 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					이용권을 삭제하시겠습니까?<br> 삭제한 이용권은 복구할 수 없습니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" onclick="del()">삭제</button>
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
						<!-- <ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main">메인</a></li>
							<li class="breadcrumb-item active">이용권 관리</li>
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
								<select class="form-select" id="pagePerNum" style="width:70px">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
								</select>&nbsp;
								<select class="form-select" id="sorting" style="width:120px">
									<option value="desc">내림차순</option>
									<option value="asc">오름차순</option>
								</select>&nbsp;
								<select class="form-select" id="sortingBranch" style="width:auto; display:none">
								</select>
							</div>
							<div class="float-right">
								<a class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#ticketAddModal" data-shuffle> 이용권 등록 </a>&nbsp;&nbsp;<a
									class="btn btn-danger" data-bs-toggle="modal"
									data-bs-target="#ticketDelModal" data-shuffle> 이용권 삭제 </a>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">이용권 리스트</h4>
							</div>
							<div class="card-body">
									<table class="table table-hover">
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
										<tbody id="ticketListBody">
											<c:forEach items="${ticketList}" var="ticket"
												varStatus="status">
												<tr>
													<td><input class="form-check-input"
														style="margin-left: 0" type="checkbox"
														value="${ticket.ticket_no}"></td>
													<td>${ticket.ticket_no}</td>
													<td><a type="button" href="#" data-bs-toggle="modal"
														data-bs-target="#ticketModModal"
														onclick="ticketModify(
													`${ticket.ticket_no}`,
													`${ticket.ticket_name}`,
													`${ticket.b_idx}`,
													`${ticket.b_name}`,
													`${ticket.ticket_time}`,
													`${ticket.ticket_price}`,
													`${ticket.ticket_type}`
													)">${ticket.ticket_name}</a></td>
													<td>${ticket.b_name}</td>
													<td><c:if test="${ticket.ticket_type eq '일반'}">일반 회원권</c:if>
														<c:if test="${ticket.ticket_type eq 'pt'}">PT 회원권</c:if></td>
													<td>${ticket.ticket_time}<c:if
															test="${ticket.ticket_type eq '일반'}">개월</c:if> <c:if
															test="${ticket.ticket_type eq 'pt'}">회</c:if>
													</td>
													<td>${ticket.ticket_price}</td>
												</tr>
											</c:forEach>
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
var checkArr = [];
var evtCheck = 0;
var showPage = 1;
const myModalEl = document.getElementById('ticketDelModal')
myModalEl.addEventListener('shown.bs.modal', event => {
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
	console.log("활성화: " + checkArr.length);
	if(checkArr.length == 0){
		evtCheck += 1
		failReload(evtCheck);
	}
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
					$('#sortingBranch').append(`<option value="`+dto.b_idx+`" selected>`+dto.b_name+`</option>`);
				} else {
					$('#sortingBranch').append(`<option value="`+dto.b_idx+`">`+dto.b_name+`</option>`);
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

function listCall(page) {
	$.ajax({
		type:'post',
		url:'ticketList.ajax',
		data:{
			'page': page,
			'cnt': $('#pagePerNum').val(),
			'sort': $('#sorting').val(),
			'branch': $('#sortingBranch').val()
		},
		dataType:'json',
		success: function (data) {
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
		error: function (e) {
			console.log(e);
		}
	})
}

function listPrint(list){
	console.log("listPrint 수행")
	var content = '';
	if(list.length > 0){
		list.forEach(function(ticket,idx){
			content += `<tr>
									<td><input class="form-check-input"
									style="margin-left: 0" type="checkbox"
									value="
									`+ticket.ticket_no+`"></td>
								<td>`+ticket.ticket_no+`</td>`
			content += `
				<td><a type="button" href="#" data-bs-toggle="modal"
					data-bs-target="#ticketModModal"
					onclick="ticketModify(
				'`+ticket.ticket_no+`',
				'`+ticket.ticket_name+`',
				'`+ticket.b_idx+`',
				'`+ticket.b_name+`',
				'`+ticket.ticket_time+`',
				'`+ticket.ticket_price+`',
				'`+ticket.ticket_type+`'
				)">`+ticket.ticket_name+`</a></td>
				<td>`+ticket.b_name+`</td>`
			if (ticket.ticket_type=="일반"){
				content += `<td>일반 회원권</td><td>`+ticket.ticket_time+`개월</td><td>`+ticket.ticket_price+`</td></tr>`
			} else {
				content += `<td>PT 회원권</td><td>`+ticket.ticket_time+`회</td><td>`+ticket.ticket_price+`</td></tr>`
			}
		});
	} else {
		content = "<tr><td colspan='7' style='text-align:center'>조회되는 이용권이 없습니다.</td></tr>"
	}
	
	
	$('#ticketListBody').empty();
	$('#ticketListBody').append(content);
}

function failReload(arg){
	if (arg==1){
		alert("최소 한 개 이상의 이용권을 선택해주세요.");
		location.reload();
	}
}

	$("#ticket-type").change(function() {
		$val = $("#ticket-type").val();
		console.log($val)
		if ($val == '일반') {
			$("#basic-addon2").text("개월");
		} else {
			$("#basic-addon2").text("회");
		}
	})

	$("#mticket_type").change(function() {
		$val = $("#mticket_type").val();
		console.log($val)
		if ($val == '일반') {
			$("#basic-addon22").text("개월");
		} else {
			$("#basic-addon22").text("회");
		}
	});

	function ticketModify(no, name, bidx, bname, time, price, type) {
		console.log("이벤트");
		console.log(name, type)
		$("#mticket_no").val(no);
		$("#mticket_name").val(name);
		$("#mbranch_name").val(bname);
		$("#mbranch_idx").val(bidx);
		$("#mticket_count").val(time);
		$("#mticket_price").val(price);
		$("#mticket_type").val(type);
		if (type == '일반') {
			$("#basic-addon22").text("개월");
		} else {
			$("#basic-addon22").text("회");
		}
	}
	
	function add() {
		if($("#ticket_name").val() != "" && $("#ticket-type").val() != "" && $("#ticket-count").val() != "" & $("#ticket-price").val() != ""){
		
		$.ajax({
			type : 'post',
			url : 'ticket.regist',
			data : {
				'b_idx' : $("#branch_idx").val(),
				'ticket_name' : $("#ticket_name").val(),
				'ticket_type' : $("#ticket-type").val(),
				'ticket_time' : $("#ticket-count").val(),
				'ticket_price' : $("#ticket-price").val()
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if (data.success) {
					alert("이용권 등록에 성공했습니다.");
					location.reload();
				}
			},
			error : function(e) {
				alert("이용권 등록에 실패했습니다.");
			}
		});
	} else {
		alert("필요 항목을 모두 선택 및 입력해주세요.");
	}
	}
	
	function mod() {
		if($("#mticket_name").val() != "" && $("#mticket_type").val() != "" && $("#mticket_count").val() != "" & $("#mticket_price").val() != ""){
		
		$.ajax({
			type : 'post',
			url : 'ticket.modify',
			data : {
				'ticket_no' : $("#mticket_no").val(),
				'b_idx' : $("#mbranch_idx").val(),
				'ticket_name' : $("#mticket_name").val(),
				'ticket_type' : $("#mticket_type").val(),
				'ticket_time' : $("#mticket_count").val(),
				'ticket_price' : $("#mticket_price").val()
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if (data.success) {
					alert("이용권 변경에 성공했습니다.");
					location.reload();
				}
			},
			error : function(e) {
				alert("이용권 변경에 실패했습니다.");
			}
		});
	} else {
		alert("필요 항목을 모두 선택 및 입력해주세요.");
	}
	}

	function del() {
		$("#ticketDelModal").css("display","none")
		$.ajax({
			type : 'get',
			url : 'ticket.delete',
			data : {
				'delList' : checkArr
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if (data.success) {
					alert("이용권 삭제에 성공했습니다.");
					location.reload();
				}
			},
			error : function(e) {
				alert("이용권 삭제에 실패했습니다.");
			}
		});
	}
</script>
</html>