<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupFit</title>
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
						<h1>입장시간 통계</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		
		<section class="content">
			  <button style="margin-left:36%" id="prevMonth" onclick="monthChange(-1)"><</button>
				  <span id="formattedDate"></span>
			  <button id="nextMonth" onclick="monthChange(1)">></button>
			  
			  <select style="margin-left:25%" name="branch" id="branch" style = "margin-left : 30px">
				<c:forEach items="${branchList}" var="item">
					<option value="${item.b_idx}">${item.b_name}</option>
				</c:forEach>
		      </select>
			  
			  <select name="day" id="day" style = "margin-left : 30px">
					<option value="monday">월</option>
					<option value="tuesday">화</option>
					<option value="wednesday">수</option>
					<option value="thursday">목</option>
					<option value="friday">금</option>
					<option value="saturday">토</option>
		      </select>
			    
			<div class="container-fluid">
				<div style="width: 1500px; height: 1000px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
				</div>
			</div>
			<!--/. container-fluid -->
			
			<h3>회원 수 추이</h3>
			<button style="margin-left:36%" onclick="branchYearChange(-1)"><</button>
			  <span id="branchYear">2023</span>
			  <button id="branchNextYear" onclick="branchYearChange(1)" disabled>></button>
			  <select style="margin-left:30%" name="countBranch" id="countBranch" style = "margin-left : 30px">
				<c:forEach items="${branchList}" var="item">
					<option value="${item.b_idx}">${item.b_name}</option>
				</c:forEach>
		      </select>
				
				<div style="width: 1500px; height: 1000px;">
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

var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth();
var myChart;
var myChart2;

function updateFormattedDate() {
  var formattedDateElement = document.getElementById("formattedDate");
  formattedDateElement.textContent = formatDate(currentYear, currentMonth);
  year = $('#formattedDate').text();
  console.log(year);
  $.ajax({
		type:'get',
		url:'memberAdmission.ajax',
		data:{
			'year':year,
			'b_idx':b_idx,
			'day':day
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			chartPrint(data.entryList);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function formatDate(year, month) {
  var formattedYear = year;
  var formattedMonth = String(month + 1).padStart(2, '0');
  return formattedYear + "-" + formattedMonth;
}

function monthChange(change) {
  currentMonth += change;

  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear -= 1;
  } else if (currentMonth > 11) {
    currentMonth = 0;
    currentYear += 1;
  }
  
 

  // 현재 연도인 경우 다음 달로 이동하는 버튼을 비활성화합니다.
  var nextMonthButton = document.getElementById("nextMonth");
  if (nextMonthButton) {
    nextMonthButton.disabled = (currentYear === new Date().getFullYear() && currentMonth === new Date().getMonth());
  }

  updateFormattedDate();
}

var nextMonthButton = document.getElementById("nextMonth");
if (nextMonthButton) {
  nextMonthButton.disabled = (currentYear === new Date().getFullYear() && currentMonth === new Date().getMonth());
}

// 초기 날짜 설정
updateFormattedDate();

var year = $('#formattedDate').text();
var b_idx=$('#branch').val();
var day = $('#day').val();
console.log(year+b_idx+day);
firstChart(year,b_idx,day);

function firstChart(year,b_idx,day){
	$.ajax({
		type:'get',
		url:'memberAdmission.ajax',
		data:{
			'year':year,
			'b_idx':b_idx,
			'day':day
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			chartPrint(data.entryList);
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
		labels.push(item.time);
		datasets.push(item.entry_count);
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

$('#day').change(function(){
	day = $(this).val();
	$.ajax({
		type:'get',
		url:'memberAdmission.ajax',
		data:{
			'year':year,
			'b_idx':b_idx,
			'day':day
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			myChart.destroy();
			chartPrint(data.entryList);	
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
});

$('#branch').change(function(){
	b_idx = $(this).val();
	$.ajax({
		type:'get',
		url:'memberAdmission.ajax',
		data:{
			'year':year,
			'b_idx':b_idx,
			'day':day
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			myChart.destroy();
			chartPrint(data.entryList);	
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
});

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