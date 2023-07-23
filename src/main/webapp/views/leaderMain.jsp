<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupFit</title>
<style type="text/css">
	.container-fluid {
	margin-top: 10px;
	display: flex;
}

.container-fluid > div {
	margin: 10px;
	flex: 1;
}

.container-fluid > div > button {
	display: inline-block;
}

.container-fluid select {
	margin-top: 10px;
	margin-left: 30%;
}
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
						<h1></h1>
					</div>
				</div>
			</div>
		<!-- Main content -->
		<section class="content">
	<div style="display: flex; align-items: center;">
	<h3 style="position: relative; top:50px;">전체 매출</h3>
		<button style="margin-left: 17%; position: relative; top:100px;" onclick="yearChange(-1)"><</button>
		<span id="year" style="margin: 0 10px; position: relative; top:100px;">2023</span>
		<button id="nextYear" style="position: relative; top:100px;" onclick="yearChange(1)" disabled>></button>
	</div>

	<div class="container-fluid" style="display: flex;">
		<!-- 첫 번째 그래프 컨테이너 -->
		<div style="flex: 1; max-width: 50%;">
			<canvas id="myChart" style="width: 100%; height: 480px; margin-top:10%;"></canvas>
		</div>

		<!-- 회원 수 추이 부분 -->
		<div style="flex: 1; max-width: 50%;">
			<h3>회원 수 추이</h3>
			<div style="display: flex; align-items: center;">
				<button style="margin-left: 44%;" onclick="branchYearChange(-1)"><</button>
				<span id="branchYear" style="margin: 0 10px;">2023</span>
				<button id="branchNextYear" onclick="branchYearChange(1)" disabled>></button>
			</div>

			<select style="margin-left: 90%;" name="countBranch" id="countBranch">
				<c:forEach items="${branchList}" var="item">
					<option value="${item.b_idx}">${item.b_name}</option>
				</c:forEach>
			</select>

			<!-- 두 번째 그래프 컨테이너 -->
			<div style="width: 100%; height: 400px;">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
</section>
	<br/>
	<div class="card card-primary"  style="width:100%">
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
			<tbody>
				<c:if test="${StayList.size() == 0}">
					<tr><th colspan="6">결재신청이 없습니다.</th></tr>
				</c:if>
				<c:forEach items="${StayList}" var="stay">
					<tr>
						<td>${stay.a_idx}</td>
						<td>${stay.approval}</td>
						<td><a href="eventDetail.do?a_idx=${stay.a_idx}&approval=${stay.approval}">${stay.subject}</a></td>
						<td>${stay.name }</td>
						<td>${stay.write_date}</td>
						<td>${stay.state}</td>
					</tr>			
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</body>
</html>


<script>
var year = parseInt($('#year').text());
firstChart(year);

var myChart;
var myChart2;

var b_idx=$('#branch').val();



function firstChart(year){
	$.ajax({
		type:'get',
		url:'totalSales.ajax',
		data:{
			'year':year
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			chartPrint(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function chartPrint(data){
	labels=[];
	datasets=[];
	data.forEach(function(item,index){
		labels.push(item.month);
		datasets.push(item.totalSales)
	});
    var context = document
    			.getElementById('myChart')
                .getContext('2d');
    myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labels,
                    datasets: [
                        { //데이터
                            label: '전체매출', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: datasets,
                            backgroundColor: [
                                'rgba(255, 159, 164, 0.2)'
                            ],
                            borderColor: [
                                // 경계선 색상
                                'rgba(50, 205, 50, 1)'
                            ],
                            borderWidth: 2, //경계선 굵기
                            pointBorderColor: 'rgba(144, 238, 144, 1)'
                        }
                    ]
                },
                options: {
                    scales: {
                    	xAxes: [{
                    	      ticks: {
                    	        fontColor: 'rgba(255, 255, 255, 1)', // x축 눈금 레이블 색상 (흰색)
                    	      },
                    	    }],
                    	    yAxes: [{
                    	      ticks: {
                    	        fontColor: 'rgba(255, 255, 255, 1)',
                    	        beginAtZero: true// y축 눈금 레이블 색상 (흰색)
                    	      },
                    	    }],
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
		type:'get',
		url:'totalSales.ajax',
		data:{
			'year':year
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			myChart.destroy();
			chartPrint(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});

  }
  
  var branchYear = parseInt($('#branchYear').text());
  var countB_idx = $('#countBranch').val();

  function branchYearChange(change) {
  	branchYear += change;
      $('#branchYear').text(branchYear);
      console.log(branchYear);
      
      if (branchYear == (new Date()).getFullYear()) {
          $('#branchNextYear').prop('disabled', true);
        } else {
          $('#branchNextYear').prop('disabled', false);
        }
      $.ajax({
  		type:'get',
  		url:'countMember.ajax',
  		data:{
  			'branchYear':branchYear,
  			'b_idx':countB_idx
  		},
  		dataType:'json',
  		success:function(data){
  			console.log(data);
  			myChart2.destroy();
  			CountMemberChartPrint(data.countList);
  		},
  		error:function(e){
  			console.log(e);
  		}
  	});
  }
  secondChart(branchYear,countB_idx);
  function secondChart(branchYear,countB_idx){
  	$.ajax({
  		type:'get',
  		url:'countMember.ajax',
  		data:{
  			'branchYear':branchYear,
  			'b_idx':countB_idx
  		},
  		dataType:'json',
  		success:function(data){
  			console.log(data);
  			CountMemberChartPrint(data.countList);
  		},
  		error:function(e){
  			console.log(e);
  		}
  	});
  }



  function CountMemberChartPrint(data){
  	labels=[];
  	datasets=[];
  	data.forEach(function(item,index){
  		labels.push(item.month);
  		datasets.push(item.countMember);
  	});
      var context = document
      			.getElementById('myChart2')
                  .getContext('2d');
      myChart2 = new Chart(context, {
          type: 'line', // 차트의 형태
          data: { // 차트에 들어갈 데이터
              labels: labels,
              datasets: [
                  { //데이터
                      label: '회원 수 추이', //차트 제목
                      fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                      data: datasets,
                      backgroundColor: [
                          'rgba(255, 159, 164, 0.2)'
                      ],
                      borderColor: [
                          // 경계선 색상
                          'rgba(50, 205, 50, 1)'
                      ],
                      borderWidth: 2, //경계선 굵기
                      pointBorderColor: 'rgba(144, 238, 144, 1)'
                  }
              ]
          },
          options: {
              scales: {
              	xAxes: [{
              	      ticks: {
              	        fontColor: 'rgba(255, 255, 255, 1)', // x축 눈금 레이블 색상 (흰색)
              	      },
              	    }],
              	    yAxes: [{
              	      ticks: {
              	        fontColor: 'rgba(255, 255, 255, 1)',
              	        beginAtZero: true// y축 눈금 레이블 색상 (흰색)
              	      },
              	    }],
              }
          }
      });
  }

  $('#countBranch').change(function(){
  	countB_idx = $(this).val();
  	$.ajax({
  		type:'get',
  		url:'countMember.ajax',
  		data:{
  			'branchYear':branchYear,
  			'b_idx':countB_idx
  		},
  		dataType:'json',
  		success:function(data){
  			console.log(data);
  			myChart2.destroy();
  			CountMemberChartPrint(data.countList);
  		},
  		error:function(e){
  			console.log(e);
  		}
  	});
  });






      
      
  	
    
            
	</script>
</html>