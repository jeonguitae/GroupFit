<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 작성하기</title>
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
						<h1>쪽지 쓰기</h1>
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
				<form action="postSendWrite.do" method="post" enctype="multipart/form-data">
					<table>
						<input type="hidden" name="send_empno" value="${emp.emp_no}"/>
						<tr>
							<th>*작성자</th>
							<td><input type="text" value="${emp.name}" readonly/></td>
						</tr>
						<tr>
							<th>*제목</th>
							<td><input type="text" name="subject"/></td>
						</tr>
						<tr>
							<th>*받는사람 이름</th>
							<td>
								<p>
									<input type="text" name="get_empno"/>
									
								</p>
							</td>
						</tr>
						<tr>
							<th>*첨부파일</th>
							<td><input type="file" name="post_photo"/></td>
						</tr>
						<tr>
							<th>*내용</th>
							<td>
								<textarea name="content"></textarea> 
							</td>
						</tr>
						<input type="submit" value="보내기"/>
						<button type="button" onclick="location.href='./postSendList.go'">목록</button>	
					</table>
				</form>
				
				<div id="list">
				
				</div>

				<button class="cng" onclick="openModal()">직원 찾기</button>&nbsp;
				
				<div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">직원 찾기</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">직원 이름</label>
				              <input type="text" class="form-control" id="emp_no" name="emp_no" placeholder="직원이름을 입력하세요">
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

openModal(page);

function listPrint(list){
	   var content="";
	   list.forEach(function(item){
	      content +='<tr>';
	      content +='<td class="text-center col-md-1">'+item.emp_no+'</td>';
	      content +='<td class="text-center col-md-1">'+item.name+'</td>';
	      content +='</tr>';
	   });
	   $('#list').empty();
	   $('#list').append(content);
	}



function openModal(page) {
    $('#event-modal').modal('show');
  }

  
$(document).on('click', '#save-event-btn2', function(page) {
    // 데이터 추출
    var emp_no = $('#emp_no').val();
    
    // AJAX 요청
    $.ajax({
      type: 'POST',
      url: 'emp_find.ajax',
      data: {
    	  'emp_no' : emp_no
      },
      success: function(data) {
        console.log(data.list);
        listPrint(data.list);
        openModal(page);
      },
      error: function(e) {
        console.log(e);
      }
    });
  });
  
$(document).on('click', '#event-modal.close, #event-modal .modal-footer .btn-secondary', function() {
    $('#event-modal').modal('hide');
  });
</script>
</html>