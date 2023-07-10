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
			
				<button class="cng" onclick="openModal2()">기구등록</button>
				<button class="fix" onclick="openModal()">기구 상태 변경</button>
			
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
				          	<h5 class="modal-title" id="event-modal-label">기구 상태변경</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">기구 이름</label>
				              <select name="mac_name">
				              		<c:forEach items="${list}" var="name">
				              			<option value="${name.mac_name}">${name.mac_name}</option>
				              		</c:forEach>
				              </select>
				            </div>
				
				            <div class="form-group">
				              <label for="start-datetime">상태 변경</label>
				              <select name="mac_status">
				              		<option value="정상">정상</option>
				              		<option value="점검중">점검중</option>
				              		<option value="고장">고장</option>
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
				          	<h5 class="modal-title" id="event-modal-label">기구등록</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">구매자</label>
				              <input type="text" class="form-control" id="emp_no" name="emp_no" value="${dto.emp_no}" readonly="readonly">
				            </div>
				
				            <div class="form-group">
				              <label for="start-datetime">기구이름</label>
				              <input type="text" class="form-control" id="mac_name" name="mac_name" placeholder="기구이름을 입력하세요">
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
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>

maclist();

function maclist(){
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
				var mac_name = '';
				var mac_status = '';
				
				if(item.name != null){
					
					mac_name = item.mac_name;
				}

				content += '<div style="text-align: center; width: 150px; height: 150px; border: 1px solid white; margin: 5px">' + '기구 명 : ' + item.mac_name + '<hr/>' + item.status + '<br/>' + name + mem_no + '</div>';
				console.log(index);
			if(index >= 0 && index <= 4){
				
				
				//$('.first_row').empty();
				$('.first_row').append(content);
			}
			
			if(index >= 5 && index <= 9){
				
				//$('.second_row').empty();
				$('.second_row').append(content);
			}
			
			if(index >= 10 && index <= 14){
				
				//$('.third_row').empty();
				$('.third_row').append(content);
			}

			if(index >= 15 && index <= 19){
				
				//$('.fourth_row').empty();
				$('.fourth_row').append(content);
			}
		});
}

function openModal() {
    $('#event-modal').modal('show');
  }
  
function openModal2() {
    $('#event-modal2').modal('show');
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

</script>
</html>