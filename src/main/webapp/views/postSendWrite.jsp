<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<style>
.container-fluid{
	width: 40%;
	margin-left: 20px;
}

</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>쪽지 작성하기</h1>
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
	         	직원 찾기
				<ul>
					<li>
						<input class="empFind" type="text" id="get_empno" name="get_empno" placeholder="직원이름을 입력하세요"/>
						<button onclick="empFind()" class="btn btn-primary"><i class="far fa-envelope"></i>직원찾기</button>
					</li>         
				</ul>
				
				<table>
					<thead>
						<tr>
							<th>사내번호</th>
							<th>직원이름</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody id ="list"></tbody>
				</table>
<%-- 				<form id="sendForm" action="postSendWrite.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
					<table>
						<input type="hidden" name="send_empno" value="${emp.emp_no}"/>
						<input type="hidden" name="get_empno" value=""/>
						<tr>
							<th>*받는사람</th>
							<td><input type="text" id="getEmpInfo" value="" readonly/></td>
						</tr>
						<tr>
							<th>*제목</th>
							<td><input type="text" id="subject" name="subject"/></td>
						</tr>
						<tr>
							<th>*내용</th>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
						<button>보내기</button>
						<button type="button" onclick="location.href='./postSendList.go'">목록</button>
					</table>
				</form> --%>
				<form id="sendForm" action="postSendWrite.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
			<div class="card-body">
				<input type="hidden" name="send_empno" value="${emp.emp_no}"/>
				<input type="hidden" name="get_empno" value=""/>
                <div class="form-group">
                  <input class="form-control" placeholder="To:" id="getEmpInfo" value="">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Subject:" id="subject" name="subject">
                </div>
                <div class="form-group">
                    <textarea id="compose-textarea" name="content" class="form-control" style="height: 300px">
                      
                    </textarea>
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i>보내기</button>
                  <button class="btn btn-default" type="button" onclick="location.href='./postSendList.go'">
                <i class="fas fa-times"></i>목록</button>
                </div>
              </div>
				</form>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>
function empFind() {
	var get_empno = $('#get_empno').val();

	$.ajax({
		type: 'post',
		url: 'empNameFind.ajax',
		data: { 'get_empno' : get_empno },
		success: function(data) {
			if (data.length > 0) { // 리스트로 결과를 받았으므로 길이로 확인
				listDraw(data);
			}
			else{
				alert('찾는 직원이 없습니다!');
				$("#sendForm input[name=get_empno]").val('');
				$("#getEmpInfo").val('');
				$('#list').empty();
			}
		},
		error: function(e) {
			alert('직원찾기에 실패 했습니다.\r\n 다시 시도해 주세요!');
			$("#sendForm input[name=get_empno]").val('');
			$("#getEmpInfo").val('');
			$('#list').empty();
		}
	});
}

function listDraw(list) {
	var content = '';
	list.forEach(function(item, index) {
		content += '<tr>';
		content += '<td>' + item.emp_no + '</td>';
		content += '<td>' + item.name + '</td>';
		content += '<td><button type="button" onclick="setEmpInfo(\'' + item.emp_no + '\', \''+ item.name +'\')">선택</button></td>';
		content += '</tr>';
	});
	$('#list').empty().append(content);
}

function setEmpInfo(emp_no, name) {
	$("#sendForm input[name=get_empno]").val(emp_no);
	var empInfo = name + " (" + emp_no + ")";
	$("#getEmpInfo").val(empInfo);
}

function validateForm() {
	   var getEmpInfo = document.getElementById('getEmpInfo').value;
	   var subject = document.getElementById('subject').value;
	   var content = document.getElementById('compose-textarea').value;
	   
	   if (getEmpInfo.trim() == '') {
	      alert('받는사람을 입력해주세요.');
	      return false;
	   }
	   
	   if (subject.trim() == '') {
	      alert('제목을 입력해주세요.');
	      return false;
	   }
	   if (content.trim() == '') {
	      alert('내용을 입력해주세요.');
	      return false;
	   }

	   return true;
	}
</script>
</html>