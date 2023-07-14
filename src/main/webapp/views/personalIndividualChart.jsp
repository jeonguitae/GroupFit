<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트연습</title>
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
						<h1>페이지 제목</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">메인</a></li>
							<li class="breadcrumb-item active">뎁스1</li>
							<li class="breadcrumb-item active">뎁스2</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		
		<section class="content">
			  <button onclick="yearChange(-1)"><</button>
			  <span id="year">2023</span>
			  <button id="nextYear" onclick="yearChange(1)" disabled>></button>
			    
			<div class="container-fluid">
				<div style="width: 500px; height: 500px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
				</div>
			</div>
			<!--/. container-fluid -->
			
			<div style="width: 500px; height: 500px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart2"></canvas>
				</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>


<script>
var emp_no="${sessionScope.loginEmp.emp_no}";
var year = parseInt($('#year').text());
console.log(emp_no);
firstChart(year,emp_no);

function firstChart(year,emp_no){
	$.ajax({
		type:'get',
		url:'personalIndividualChart.ajax',
		data:{
			'year':year,
			'emp_no':emp_no
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			chartPrint(data.individual);
		},
		error:function(e){
			console.log(e);
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
		url:'personalIndividualChart.ajax',
		data:{
			'year':year,
			'emp_no':emp_no
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			chartPrint(data.individual);
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
    var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labels,
                    datasets: [
                        { //데이터
                            label: '전체매출', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: datasets,
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
}


var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1을 해주고, padStart()로 두 자리로 만듭니다.

var formattedDate = currentYear + "-" + currentMonth;

var b_idx="${sessionScope.loginEmp.b_idx}";

console.log("Current Year-Month:", formattedDate);

secondChart(formattedDate,b_idx);

function secondChart(formattedDate,b_idx){
		$.ajax({
  		type:'get',
  		url:'branchPersonal.ajax',
  		data:{
  			'formattedDate':formattedDate,
  			'b_idx':b_idx
  		},
  		dataType:'json',
  		success:function(data){
  			console.log(data);
  			branchPersonalChartPrint(data.branchPersonal);
  		},
  		error:function(e){
  			console.log(e);
  		}
  	});
	}
	
function branchPersonalChartPrint(data){
	labels=[];
	datasets=[];
	data.forEach(function(item,index){
		labels.push(item.name);
		datasets.push(item.personal_totalsales)
	});
    var context = document
    			.getElementById('myChart2')
                .getContext('2d');
    var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: labels,
                    datasets: [
                        { //데이터
                            label: '전체매출', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: datasets,
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
}





            

      
      
  	
    
            
	</script>
</html>