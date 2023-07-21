<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>
<style>
table {
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
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
table thead th {
  text-align: center;
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
						<h1>MY PT 회원 리스트</h1>
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
				<div class="row">
					<div class="col-12">
						<div style="height: 50px">
						
							<form action="ptmemsearch.do" class="search">
								<select name="sortting">
									<option value="mem_no">회원번호</option>
									<option value="name">이름</option>
									<option value="gender">성별</option>
								</select>
								
								<input type="text" name="txt" value="" placeholder="검색어를 입력하세요"/>
								
								<button>검색</button>
							</form>		
							
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">MY PT 회원 리스트</h4>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="table-light">
										<tr>
											<th>삭제</th>
											<th>회원번호</th>
											<th>이름</th>
											<th>등록횟수 / 잔여횟수</th>
											<th>성별</th>
										</tr>
									</thead>
									<tbody id="ptmemlist"></tbody>
								</table>
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
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>

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
		content += '<td><input type="checkbox" value="'+item.mem_no+'"/></td>';
		content += '<td>'+item.mem_no+'</td>';
		content += '<td><a onclick="openModal('+item.mem_no+')">'+item.name+'</a></td>';
		content += '<td>'+item.ticket_time+' / '+item.count+'</td>';	
		content += '<td>'+item.gender+'</td>';
		content += '</tr>';
	});
	$('#ptmemlist').empty();
	$('#ptmemlist').append(content);
}

$('#all').click(function(e){	
	var $chk = $('input[type="checkbox"]');
	console.log($chk);
	if($(this).is(':checked')){
		$chk.prop('checked',true);
	}else{
		$chk.prop('checked',false);
	}	
});

function memdel(){
	
	var checkArr = [];
	
	$('input[type="checkbox"]:checked').each(function(idx,item){		
		//checkbox 에 value 를 지정하지 않으면 기본값을 on 으로 스스로 지정한다.
		if($(this).val()!='on'){
			//console.log(idx,$(this).val());
			checkArr.push($(this).val());
		}	
	});
	
	console.log(checkArr);
		
	$.ajax({
		type:'get',
		url:'memdel.ajax',
		data:{'delList':checkArr},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success){
				alert(data.msg);
				memlist();
			}
		},
		error:function(e){
			console.log(e);
		}		
	});
	
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