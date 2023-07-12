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
						<h1>기구 관리</h1>
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
			
				<button class="btn btn-primary" onclick="openModal2()">기구등록</button>
				<button class="btn btn-secondary" onclick="openModal3()">기구 사진 등록</button>

			
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
				
				<div class="fifth_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<div class="sixth_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<div class="modal fade" id="event-modal2" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">기구등록</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">구매자</label>
				              <input type="text" class="form-control" id="emp_no1" name="emp_no" value="${sessionScope.loginId}" readonly="readonly">
				            </div>
				
				            <div class="form-group">
				              <label for="start-datetime">기구 이름</label>
				              <input type="text" class="form-control" id="mac_name1" name="mac_name" placeholder="기구이름을 입력하세요">
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">구매 일자</label>
				              <input type="date" class="form-control" id="purch_date" name="purch_date" value="">
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
				          <form action="mac_photo_reg.do?" method="post" enctype="multipart/form-data">
				          
				          	<div class="form-group">
				              <label for="event-name">기구 이름</label>
				              <select name="mac_name">
				              		<c:forEach items="${list}" var="name">
				              			<option value="${name.mac_name}">${name.mac_name}</option>
				              		</c:forEach>
				              </select>
				            </div>
				            
				            <div class="form-group">
				            	<label for="start-datetime">기구사진</label>
				            	<input type="file" name="photo"/>
				            </div>
				            
					        <div class="modal-footer">
					          <input type="button" class="btn btn-secondary" data-dismiss="modal" value="취소"/>
					          <button type="submit" class="btn btn-primary">저장</button>
					        </div>
				          </form>
				        </div>
				      </div>
				   </div>
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
				          <form action="mac_photo_reg.do?" method="post" enctype="multipart/form-data">
				          
				          	<div class="form-group">
				              <label for="event-name">기구 이름</label>
				              <div id="machine_name">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">기구사진</label>
				              <div id="machine_photo">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">구매일자</label>
				              <div id="machine_purch">
				              	
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="start-datetime">구매자</label>
				              <div id="machine_emp">
				              	
				              </div>
				            </div>
				            
					        <div class="modal-footer">
					        </div>
				          </form>
				          <input type="button" id="photodel" onclick="#" class="btn btn-primary" value="삭제"/>
				          <input type="button" class="btn btn-secondary" data-dismiss="modal" value="돌아가기"/>
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

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

maclists();

function maclists(){
	$.ajax({
		type:'get',
		url:'maclist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			maclistDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function maclistDraw(maclist){
	
		maclist.forEach(function(item,index){
			
			var content = '';

			content += '<div style="text-align: center; width: 150px; height: 150px; border: 1px solid white; margin: 5px">'
					+ item.mac_name
					+ '<br/>'
					/* + '<a href="macdetail.do?mac_num=' + item.mac_num + '">' */
					+ '<a onclick=openModal(' + item.mac_num + ')>'		
					+ '<img width="100%" height="85%" src="/photo/' + item.new_photo_name + '"/>'
					+ '</a>' 
					+ '<br/>' 
					+ '</div>';
					
			if(index >= 0 && index <= 4){
				
				$('.first_row').append(content);
			}
			
			if(index >= 5 && index <= 9){
				
				//$('.second_row').empty();
				$('.second_row').append(content);
			}
			
			if(index >= 10 && index <= 14){
				
				$('.third_row').append(content);
			}

			if(index >= 15 && index <= 19){
				
				$('.fourth_row').append(content);
			}
			
			if(index >= 20 && index <= 24){
							
				$('.fifth_row').append(content);
			}
						
			if(index >= 25 && index <= 29){
				
				$('.sixth_row').append(content);
			}
		});
}

function openModal2() {
    $('#event-modal2').modal('show');
  }
  
function openModal3() {
    $('#event-modal3').modal('show');
  }
  
function openModal(mac_num) {
	$.ajax({
	      type: 'get',
	      url: 'mac_info.ajax',
	      data: {
	    	  'mac_num' : mac_num
	      },
	      success: function(data) {
	    	macinfoDraw(data.dto);
	      },
	      error: function(e) {
	        console.log(e);
	      }
	 });
	
    $('#event-modal').modal('show');
  }
  
function macinfoDraw(macinfo){
	
		var mac_photo = '';
		
		mac_photo += '<div><img width="100%" height="100%" src="/photo/' + macinfo.new_photo_name + '"></div>';
		
		$('#machine_name').empty();
		$('#machine_name').append(macinfo.mac_name);
		
		$('#machine_photo').empty();
		$('#machine_photo').append(mac_photo);
		
		$('#machine_purch').empty();
		$('#machine_purch').append(macinfo.purch_date);
		
		$('#machine_emp').empty();
		$('#machine_emp').append(macinfo.emp_no);
		
		$('input[id="photodel"]').attr('onclick', 'location.href="macdel.do?mac_num=' + macinfo.mac_num + '"');

}
  
$(document).on('click', '#event-modal .close, #event-modal .modal-footer .btn-secondary', function() {
    $('#event-modal').modal('hide');
  });
  
$(document).on('click', '#save-event-btn2', function() {
    // 데이터 추출
    var emp_no = $('#emp_no1').val();
    var mac_name = $('#mac_name1').val();
    var purch_date = $('#purch_date').val();
    
    // AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'mac_reg.ajax',
      data: {
    	  'emp_no' : emp_no,
    	  'mac_name' : mac_name,
    	  'purch_date' : purch_date
      },
      success: function(data) {
        alert(data.alert);
        $('#event-modal2').modal('hide');
        openModal3();
        location.href = 'maclist.go';
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
  
$(document).on('click', '#event-modal2 .close, #event-modal2 .modal-footer .btn-secondary', function() {
    $('#event-modal2').modal('hide');
  });
  
$(document).on('click', '#event-modal3 .close, #event-modal3 .modal-footer .btn-secondary', function() {
    $('#event-modal3').modal('hide');
  });

</script>
</html>