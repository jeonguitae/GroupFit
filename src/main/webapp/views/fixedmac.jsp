<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수리신청 된 머신</title>
<style>
/* table, th, td{
		border: 1px solid white;
		border-collapse: collapse;
	} */
	div[class="search"]{
		margin-left: -4px;
	}
	
	h1.headline{
		margin-left: 640px;
		margin-top: 20px;
	}
	
	table {
	   width: 800px;
	   border: 1px solid black;
	   border-collapse: collapse;
	   margin-left: -4px;
	}
	
	th, td {
	   border: 1px solid black;
	   padding: 5px 10px;
	   text-align: center;
	}
	
	tfoot td {
	   font-weight: bold;
	}
	
	.empty-data {
	   text-align: center;
	   padding: 10px;
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
</head>
<body>
   <jsp:include page="GroupFit_gnb.jsp" />
   
   <div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>수리신청 된 머신</h1>
					</div>
					
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

<!-- Main content -->
      <!-- <section class="content">
            <h1 class="headline">수리신청 된 머신</h1>
            	<div class="search">
					<select name="sortting">
						<option value="mac_num">기구이름</option>
					</select>
					
					<input type="text" name="txt" value="" placeholder="기구이름을 입력하세요"/>
					
					<button onclick="macsearch()">검색</button>
				</div>	
	
		<div class="table">
			<table class="table">
				<thead class="table-light">
					<tr>
						<th style="text-align: center;">기구이름</th>
						<th style="text-align: center;">신청일</th>
						<th style="text-align: center;">신청자</th>
					</tr>
				</thead>		
				<tbody id="fixedmaclist">
				</tbody>
			</table>  -->
			
			<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div style="height: 50px">
							<div class="float-left">
							
								<div class="search">
									<select name="sortting">
										<option value="mac_num">기구이름</option>
									</select>
									
									<input type="text" name="txt" value="" placeholder="기구이름을 입력하세요"/>
									
									<button onclick="macsearch()">검색</button>
								</div>	
								
							</div>

						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">일지 리스트</h4>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="table-light">
										<tr>
											<th style="text-align: center;">기구이름</th>
											<th style="text-align: center;">신청일</th>
											<th style="text-align: center;">신청자</th>
										</tr>
									</thead>
									<tbody id="ptlist"></tbody>
								</table>
							</div>
			
			
			
			<div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">신청 사유</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        
				        <div class="modal-body">
				          <form id="event-form">
				     
				          	<div class="form-group">
				              <label for="event-name">기구 번호</label>
				              <div class="mac_num">
				              
				              </div>
				            </div>
				          	
				          	<div class="form-group">
				              <label for="event-name">기구 이름</label>
				              <div class="mac_name">
				              
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="event-name">기구 사진</label>
				              <div class="mac_photo">
				              
				              </div>
				            </div>
				            
				            <div class="form-group">
				              <label for="event-name">수리 요청 내용</label>
				              <div class="fixed_content">
				              
				              </div>
				            </div>
				            
					        <div class="modal-footer">
					          <input type="button" class="btn btn-secondary" data-dismiss="modal" value="취소"/>
					          <input type="button" class="btn btn-primary" id="mac_break" value="고장"/>
					          <input type="button" class="btn btn-primary" id="mac_fixed" value="수리완료"/>
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
        
         <!--/. container-fluid -->
      </section>
   </div>
</body>
<script>

fixedmaclist();

function fixedmaclist(){
	$.ajax({
		type:'get',
		url:'fixedmaclist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			fixedmaclistDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function fixedmaclistDraw(fixedmaclist){

	var content = '';
	
	fixedmaclist.forEach(function(item,index){
		
			content += '<tr>';
			content += '<td><a onclick="openModal(' + item.mac_num + ')">' + item.mac_name + '</a></td>';
			content+='<td>'+item.fixed_date+'</td>';
			content+='<td>'+item.emp_no+'</td>';		
			content += '</tr>';
		});
	$('#fixedmaclist').empty();
	$('#fixedmaclist').append(content);
}

function macsearch(){
	
	var sortting = $('select[name="sortting"]').val();
	var txt = $('input[name="txt"]').val();
	
	$.ajax({
		type:'get',
		url:'macsearch.ajax',
		data:{
			'sortting' : sortting
			, 'txt' : txt
		},
		dataType:'json',
		success:function(data){
			fixedmaclistDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function openModal(mac_num) {
	
	// AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'fix_content.ajax',
      data: {
    	 'mac_num' : mac_num
      },
      success: function(data) {
        fix_contentDraw(data.dto);
      },
      error: function(e) {
        console.log(e);
      }
    });
	
    $('#event-modal').modal('show');
  }
  
$(document).on('click', '#event-modal .close, #event-modal  .modal-footer .btn-secondary', function() {
    $('#event-modal').modal('hide');
  });
  
function fix_contentDraw(detail){
		
	var mac_photo = '';
	
	mac_photo += '<div><img width="100%" height="100%" src="/photo/' + detail.new_photo_name + '"></div>';
	
	$('.mac_num').empty();
	$('.mac_num').append(detail.mac_num);
	
	$('.mac_name').empty();
	$('.mac_name').append(detail.mac_name);
	
	$('.mac_photo').empty();
	$('.mac_photo').append(mac_photo);
	
	$('.fixed_content').empty();
	$('.fixed_content').append(detail.fixed_content);
	
}

$(document).on('click', '#mac_break', function() {
    // 데이터 추출
    var $mac_num = $('.mac_num').html();
    var $mac_status = $('#break').val();
    
    // AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'mac_reg.ajax',
      data: {
    	  'mac_num' : $mac_num,
    	  'mac_status' : $mac_status
      },
      success: function(data) {
        alert(data.msg);
        $('#event-modal').modal('hide');
        location.href = 'fixedmac.go';
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
  
$(document).on('click', '#mac_fixed', function() {
    // 데이터 추출
    var $mac_num = $('.mac_num').html();
    var $mac_status = $('#mac_fixed').val();
    
    // AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'mac_status_cng.ajax',
      data: {
    	  'mac_num' : $mac_num,
    	  'mac_status' : $mac_status
      },
      success: function(data) {
        alert(data.msg);
        $('#event-modal2').modal('hide');
        location.href = 'fixedmac.go';
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
</script>
</html>