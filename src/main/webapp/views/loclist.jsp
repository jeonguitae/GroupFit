<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	div.meminfo. div.memprofile{
		float: center;
	}
</style>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>
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
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>라커 관리</h1>
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
			<div class="container-fluid">
			
				<button class="cng" onclick="openModal2()">라커변경</button>
				<button class="fix" onclick="openModal()">상태변경</button>
				
			
				<div class="first_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<br/>
				
				<div class="second_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<br/>
				
				<div class="third_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<br/>
				
				<div class="fourth_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				 <div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">라커 상태변경</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">라커 번호</label>
				              <input type="text" class="form-control" id="loc_no" name="loc_no" placeholder="라커번호를 입력하세요">
				            </div>
				
				            <div class="form-group">
				              <label for="start-datetime">상태 변경</label>
				              <!-- <input id="start_time" type="datetime-local" class="form-control" name="start_time"> -->
				              <select name="status">
				              		<option value="미사용">미사용</option>
				              		<option value="점검중">점검중</option>
				              </select>
				            </div>
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				          <button type="button" class="btn btn-primary" id="save-event-btn">저장</button>
				        </div>
				      </div>
				   </div>
				</div>
				
				<div class="modal fade" id="event-modal2" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">회원 라커 변경</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">회원 번호</label>
				              <input type="text" class="form-control" id="mem_no" name="mem_no" placeholder="회원번호를 입력하세요">
				            </div>
				
				            <div class="form-group">
				              <label for="start-datetime">라커 번호</label>
				              <!-- <input id="start_time" type="datetime-local" class="form-control" name="start_time"> -->
				              <input type="text" class="form-control" id="loc_no2" name="loc_no" placeholder="라커번호를 입력하세요">
				            </div>
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				          <button type="button" class="btn btn-primary" id="save-event-btn2">저장</button>
				        </div>
				      </div>
				   </div>
				</div>
				
				<div class="modal fade" id="event-modal3" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
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
				            
					        <div class="modal-footer">
					          <input type="button" id="close" class="btn btn-secondary" data-dismiss="modal" value="돌아가기"/>
					        </div>
				          </form>
				        </div>
				      </div>
				   </div>
				</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>

loclist();

function loclist(){
	$.ajax({
		type:'get',
		url:'loclist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			loclistDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function loclistDraw(loclist){
	

		loclist.forEach(function(item,index){
				var content = '';
				var name = '';
				var mem_no = '';
				
				if(item.name != null){
					
					name = item.name;

				}
				
				if(item.mem_no != 0){
					
					mem_no = '(' + item.mem_no + ')';
				}

				content += '<div class="locker" style="text-align: center; width: 150px; height: 150px; border: 1px solid white; margin: 5px">'
						+ '라커번호 : ' 
						+ item.loc_no + '<hr/>' 
						+ '<span id="'+item.loc_num+'">'+item.status +'</span><br/>' 
						+ name 
						+ '<a onclick="openModal3('+mem_no+')">'+mem_no+'</a>';
						+ '</div>';
				console.log(index);
			if(index >= 0 && index <= 4){

				$('.first_row').append(content);
			}
			
			if(index >= 5 && index <= 9){
		
				$('.second_row').append(content);
			}
			
			if(index >= 10 && index <= 14){

				$('.third_row').append(content);
			}

			if(index >= 15 && index <= 19){
	
				$('.fourth_row').append(content);
				
			}
			
			$('div[class="locker"]').on('mouseenter',function(){
			    $(this).css({'background-color':'lightgray'});
			    $(this).css({'color':'black'});
			});
			
			$('div[class="locker"]').on('mouseleave',function(){
			    $(this).css({'background-color':'#454d55'});
			    $(this).css({'color':'white'});
			});
				
			if(item.status == '사용중'){
				$('#'+item.loc_num).css({'color' : 'red'});
			}
			
			if(item.status == '점검중'){
				$('#'+item.loc_num).css({'color' : 'yellow'});
			}
			
			if(item.status == '미사용'){
				$('#'+item.loc_num).css({'color' : 'lightblue'});
			}
		});
}

function openModal() {
    $('#event-modal').modal('show');
  }
  
function openModal2() {
    $('#event-modal2').modal('show');
  }
  
function openModal3() {
    $('#event-modal3').modal('show');
  }
  
$(document).on('click', '#save-event-btn', function() {
    // 데이터 추출
    var loc_no = $('#loc_no').val();
    var status = $('select[name="status"]').val();
    
    // AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'loc_status.ajax',
      data: {
    	  'loc_no' : loc_no,
    	  'status' : status
      },
      success: function(data) {
        alert(data.alert);
        $('#event-modal').modal('hide');
        location.href = 'loclist.go';
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
  
$(document).on('click', '#event-modal .close, #event-modal .modal-footer .btn-secondary', function() {
    $('#event-modal').modal('hide');
  });
  
$(document).on('click', '#event-modal3 .close, #event-modal3 .modal-footer .btn-secondary', function() {
    $('#event-modal3').modal('hide');
  });
  
$(document).on('click', '#save-event-btn2', function() {
    // 데이터 추출
    var loc_no = $('#loc_no2').val();
    var mem_no = $('#mem_no').val();
    
    // AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'loc_no_cng.ajax',
      data: {
    	  'loc_no' : loc_no,
    	  'mem_no' : mem_no
      },
      success: function(data) {
        alert(data.alert);
        $('#event-modal2').modal('hide');
        location.href = 'loclist.go';
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
  
$(document).on('click', '#event-modal2 .close, #event-modal2 .modal-footer .btn-secondary', function() {
    $('#event-modal2').modal('hide');
  });


function openModal3(mem_no) {
	
	$.ajax({
	      type: 'get',
	      url: 'mem_info.ajax',
	      data: {
	    	  'mem_no' : mem_no
	      },
	      success: function(data) {
	    	meminfoDraw(data.dto);
	      },
	      error: function(e) {
	        console.log(e);
	      }
	 });
	
    $('#event-modal3').modal('show');
}

function meminfoDraw(meminfo){

	var duration = '';
	
	duration = '<div>'+ meminfo.start_date +  ' ~ ' + meminfo.end_date +'</div>'
	
	$('#mem_no').empty();
	$('#mem_no').append(meminfo.mem_no);
	
	$('#mem_name').empty();
	$('#mem_name').append(meminfo.name);
	
	$('#emp_no').empty();
	$('#emp_no').append(meminfo.emp_no);
	
	$('#gender').empty();
	$('#gender').append(meminfo.gender);
	
	$('#birth').empty();
	$('#birth').append(meminfo.birth);
	
	$('#duration').empty();
	$('#duration').append(duration);
}
</script>
</html>