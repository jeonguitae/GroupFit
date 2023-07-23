<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupFit</title>
<style type="text/css">
</style>
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
<script src="plugins/chart.js/Chart.js"></script>
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
					</div>
					<div class="col-sm-6">
						<!-- <ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main"></a></li>
							<li class="breadcrumb-item active"></li>
						</ol> -->
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">지점 매출</h4>
							</div>
							<div class="card-body" id="branch-card-body">
								<div style="">
									<div class="float-left" style="display: flex">
										<h3 style="">${sessionScope.loginEmp.b_name}점</h3>
									</div>

									<div class="float-right">
										<div style="display: flex">
											<button class="btn btn-info" onclick="yearChange(-1)">&laquo;</button>
											&nbsp; <span id="year" style="font-size: 17pt">2023</span>&nbsp;
											<button class="btn btn-info" id="nextYear"
												onclick="yearChange(1)" disabled>&raquo;</button>
										</div>

									</div>
								</div>



								<div class="container-fluid">
									<div style="">
										<!--차트가 그려질 부분-->
										<canvas id="myChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div style="display:flex">
						<div class="card card-primary"  style="width:50%">
							<div class="card-header">
								<h4 class="card-title">출퇴근 변경 요청</h4>
							</div>
							<div class="card-body" id="branch-card-body">
								<table class="table">
									<thead>
										<tr>
											<th>요청일</th>
											<th>제목</th>
											<th>이름</th>
											<th>직급</th>
											<th>수정 요청 사항</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody id="rlistTbody">
									</tbody>
								</table>
							</div>
						</div> &nbsp;&nbsp;
						<div class="card card-primary"  style="width:50%">
							<div class="card-header">
								<h4 class="card-title">결재 리스트</h4>
							</div>
							<div class="card-body" id="branch-card-body">
								<table class="table">
									<thead>
										<tr>
											<th>No.</th>
											<th>결재구분</th>
											<th>제목</th>
											<th>신청자</th>
											<th>기안일</th>
											<th>처리상태</th>
										</tr>
									</thead>
									<tbody id="alistTbody">
									</tbody>
								</table>
							</div>
						</div>
						</div>

					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script>
	var year = parseInt($('#year').text());
	var b_idx = "${sessionScope.loginEmp.b_idx}";
	firstChart(year, b_idx);
	var myChart;
	
	getrList();
	getaList();
	
	function getrList(){
		$.ajax({
			type : 'post',
			url : 'rlist.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log(data.rlist);
				content = ""
				if(data.rlist.length > 0){
					data.rlist.forEach(function(dto, index){
						content += `<tr>
												<th>`+ dto.reg_date +`</th>
												<th><a href="rdetail.do?r_idx=`+ dto.r_idx +`" id="detail">`+ dto.title +`</th>
												<th>`+ dto.name +`</th>
												<th>`+ dto.position +`</th>
												<th>`+ dto.com_category +`</th>
												<th>`+ dto.status +`</th>
											</tr>`;
					});
				} else {
					content = `<tr><th colspan="6" style="text-align:center;">출퇴근 변경 요청이 없습니다.</th></tr>` 
				}
				$("#rlistTbody").html(content);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function getaList(){
		console.log("getaList 실행");
		$.ajax({
			type : 'post',
			url : 'approvalExpectedList.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log("데이터: " + data.alist, data.alist.length);
				content = ""
				if(data.alist.length > 0){
					data.alist.forEach(function(dto, index){
						content += `<tr>
												<th>`+ dto.a_idx +`</th>
												<th>`+ dto.approval +`</th>
												<th><a href="eventDetail.do?a_idx=`+expected.a_idx+`&approval=`+expected.approval+`">`+ dto.subject +`</th>
												<th>`+ dto.name +`</th>
												<th>`+ dto.write_date +`</th>
												<th>`+ dto.state +`</th>
											</tr>`;
					});
				} else {
					content = `<tr><th colspan="6" style="text-align:center;">결재 요청이 없습니다.</th></tr>` 
				}
				$("#alistTbody").html(content);
			},
			error : function(e) {
				console.log("alist 불러오기 실패");
				console.log(e);
			}
		});
	}

	function firstChart(year, b_idx) {
		$.ajax({
			type : 'get',
			url : 'branchSales.ajax',
			data : {
				'year' : year,
				'b_idx' : b_idx
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				chartPrint(data.list)
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function chartPrint(data) {
		labels = [];
		datasets = [];
		data.forEach(function(item, index) {
			labels.push(item.month);
			datasets.push(item.totalSales)
		});
		var context = document.getElementById('myChart').getContext('2d');
		myChart = new Chart(context, {
			type : 'line', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : labels,
				datasets : [ { //데이터
					label : '전체매출', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : datasets,
					backgroundColor : [ 'rgba(255, 159, 164, 0.2)' ],
					borderColor : [
					// 경계선 색상
					'rgba(50, 205, 50, 1)' ],
					borderWidth : 2, //경계선 굵기
					pointBorderColor : 'rgba(144, 238, 144, 1)'
				} ]
			},
			options : {
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : 'rgba(255, 255, 255, 1)', // x축 눈금 레이블 색상 (흰색)
						},
					} ],
					yAxes : [ {
						ticks : {
							fontColor : 'rgba(255, 255, 255, 1)',
							beginAtZero : true
						// y축 눈금 레이블 색상 (흰색)
						},
					} ],
				}
			}
		});
	}

	function yearChange(change) {
		year += change;
		$('#year').text(year);

		if (year == (new Date()).getFullYear()) {
			$('#nextYear').prop('disabled', true);
		} else {
			$('#nextYear').prop('disabled', false);
		}
		$.ajax({
			type : 'get',
			url : 'branchSales.ajax',
			data : {
				'year' : year,
				'b_idx' : b_idx
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				myChart.destroy();
				chartPrint(data.list);
			},
			error : function(e) {
				console.log(e);
			}
		});

	}
	console.log("${sessionScope.loginEmp.b_name}");
	console.log("${sessionScope.loginEmp.b_idx}");
	console.log("${sessionScope.loginEmp.position}");
</script>
</html>