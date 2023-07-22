<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
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
<style>
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>트레이너 메인</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="main">메인</a></li>
							<li class="breadcrumb-item active">트레이너 메인 페이지</li>
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
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">트레이너 매출</h4>
							</div>
							<div class="card-body" id="branch-card-body">
								<div style="">
									<div class="float-left" style="display: flex">
										<h3 style="">${sessionScope.loginEmp.b_name}점</h3>
									</div>

									<div class="float-right">
										<div style="display: flex">
											<button class="btn btn-info" onclick="yearChange(-1)">&laquo;</button>
											&nbsp; <span id="year_month" style="font-size: 17pt">2023</span>&nbsp;
											<button class="btn btn-info" id="nextYear"
												onclick="yearChange(1)" disabled>&raquo;</button>
										</div>

									</div>
								</div>



								<div class="container-fluid">
									<div style="">
										<!--차트가 그려질 부분-->
										<canvas id="myChart2"></canvas>
									</div>
								</div>
							</div>
						</div>
			 				
						
						<div style="display:flex">
						<div class="card card-primary"  style="width:50%">
							<div class="card-header">
								<h4 class="card-title">오늘 일정</h4>
							</div>
							<div class="card-body" id="branch-card-body">
								<table class="table">
									<thead>
										<tr>
											<th>회원이름</th>
											<th>시작시간</th>
											<th>종료시간</th>
										</tr>
									</thead>
									<tbody>
										  <c:forEach var="calendarlist" items="${calendarlist}">
									        <tr>
									            <td>${calendarlist.event_name}</td>
									            <td>${fn:substring(calendarlist.start_time, 11, 16)}</td>
									            <td>${fn:substring(calendarlist.end_time, 11, 16)}</td>
									        </tr>
									    </c:forEach>
									
										
									</tbody>
								</table>
								</div>
							</div>&nbsp;&nbsp;
							<div class="card card-primary"  style="width:50%">
							<div class="card-header">
								<h4 class="card-title">PT 회원</h4>
							</div>
							<div class="card-body" id="branch-card-body">
								<table class="table">
									<thead>
										<tr>
											<th>회원번호</th>
											<th>이름</th>
											<th>등록횟수 / 잔여횟수</th>
											<th>성별</th>
										</tr>
									</thead>
									<tbody id="ptmemlist"></tbody>
								</table>
							</div>
						
							
							
					
   		
   		<div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">기구 사진 등록</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        
				        <div class="modal-body">
				          <form action="event-form">
				          	<div class="form-group">
				              <label for="event-name">회원 번호</label>
				              <div id="mem_no">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="event-name">회원 이름</label>
				              <div id="mem_name">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">판매자</label>
				              <div id="emp_no">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">성별</label>
				              <div id="gender">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">생년월일</label>
				              <div id="birth">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">등록기간</label>
				              <div id="duration">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">잔여 pt횟수</label>
				              <div id="pt_count">
				              	
				              </div>
				            </div>
				            
					        <div class="modal-footer">
					          <input type="button" id="close" class="btn btn-secondary" data-dismiss="modal" value="돌아가기"/>
					        </div>
				          </form>
				        </div>
				      </div>
				   </div>
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
    myChart2 = new Chart(context, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: labels,
            datasets: [
                { //데이터
                    label: '직원매출', //차트 제목
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
$('#year_month').html(formattedDate);




ptmemlist();

function ptmemlist(){
	$.ajax({
		type:'get',
		url:'ptmemlist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			listDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function listDraw(ptmemlist){
	//console.log(list);
	var content = '';
	ptmemlist.forEach(function(item,index){
		
		content += '<tr>';
		content += '<td>'+item.mem_no+'</td>';
		content += '<td><a onclick="openModal('+item.mem_no+')">'+item.name+'</a></td>';
		content += '<td>'+item.ticket_time+' / '+item.count+'</td>';	
		content += '<td>'+item.gender+'</td>';
		content += '</tr>';
	});
	$('#ptmemlist').empty();
	$('#ptmemlist').append(content);
}


function openModal(mem_no) {
	
	$.ajax({
	      type: 'get',
	      url: 'ptmem_info.ajax',
	      data: {
	    	  'mem_no' : mem_no
	      },
	      success: function(data) {
	    	ptmeminfoDraw(data.dto);
	      },
	      error: function(e) {
	        console.log(e);
	      }
	 });
	
    $('#event-modal').modal('show');
}


function ptmeminfoDraw(ptmeminfo){

	var duration = '';
	
	duration = '<div>'+ ptmeminfo.start_date +  ' ~ ' + ptmeminfo.end_date +'</div>'
	
	$('#mem_no').empty();
	$('#mem_no').append(ptmeminfo.mem_no);
	
	$('#mem_name').empty();
	$('#mem_name').append(ptmeminfo.name);
	
	$('#emp_no').empty();
	$('#emp_no').append(ptmeminfo.emp_no);
	
	$('#gender').empty();
	$('#gender').append(ptmeminfo.gender);
	
	$('#birth').empty();
	$('#birth').append(ptmeminfo.birth);
	
	$('#duration').empty();
	$('#duration').append(duration);
	
	$('#pt_count').empty();
	$('#pt_count').append(ptmeminfo.count);
}


$(document).on('click', '#event-modal .close, #event-modal .modal-footer .btn-secondary', function() {
    $('#event-modal').modal('hide');
  });


</script>
</html>