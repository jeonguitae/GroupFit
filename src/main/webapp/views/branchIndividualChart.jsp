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
						<h1>직원 매출</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		
		<section class="content">
			  <button style="margin-left:36%" onclick="yearChange(-1)"><</button>
			  <span id="year">2023</span>
			  <button id="nextYear" onclick="yearChange(1)" disabled>></button>
			  
		      <select style="margin-left:25%" name="emp" id="emp" style = "margin-left : 30px">
		      	<c:forEach items="${empList}" var="item">
					<option value="${item.emp_no}">${item.name}</option>
				</c:forEach>
		      </select>
			  
			  
			<div class="container-fluid">
				<div style="width: 1500px; height: 1000px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
				</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>


<script>
var year = parseInt($('#year').text());
var emp_no = $('#emp').val();
firstChart(year,emp_no);
var myChart;

function firstChart(year,emp_no){
	$.ajax({
		type:'get',
		url:'branchIndividualChart.ajax',
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
		url:'branchIndividualChart.ajax',
		data:{
			'year':year,
			'emp_no':emp_no
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			myChart.destroy();
			chartPrint(data.individual);
		},
		error:function(e){
			console.log(e);
		}
	});
}

$('#emp').change(function(){
	emp_no = $(this).val();
	$.ajax({
		type:'get',
		url:'branchIndividualChart.ajax',
		data:{
			'year':year,
			'emp_no':emp_no
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			myChart.destroy();
			chartPrint(data.individual);	
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
});

	
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







      
      
  	
    
            
	</script>
</html>