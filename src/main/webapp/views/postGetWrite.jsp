<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회신 보내기</title>
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
<style>
h6{
	margin: left 20px;
}

.card-header {
    background-color: #3f6791;
    border-bottom: 5px solid rgb(117 59 59 / 13%);
    padding: 0.75rem 1.25rem;
    position: relative;
    font-weight: bold;
    vertical-align: sub;
}
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
						<h1>회신 보내기</h1>
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
 <%-- 				<form action="postGetWrite.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
					<table>
						<input type="hidden" name="send_empno" value="${post.get_empno}"/>
						<tr>
							<th>*제목</th>
							<td><input id="subject" type="text" name="subject"/></td>
						</tr>
						<tr>
							<th>*받는사람 이름</th>
							<td>
								<input type="hidden" name="get_empno" value="${post.send_empno}"/>
								<input type="text" value="${post.name}"/>
							</td>
						</tr>
						<tr>
							<th>*내용</th>
							<td>
								<textarea id="content" name="content"></textarea> 
							</td>
						</tr>
						<input class="btn btn-primary" type="submit" value="회신보내기"/>
						<button class="btn btn-primary" type="button" onclick="location.href='./postSendList.go'">목록</button>	
					</table>
				</form>  --%>
				<form action="postGetWrite.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
					<div class="card-body">
						<input type="hidden" name="send_empno" value="${post.get_empno}"/>
						<input type="hidden" name="get_empno" value="${post.send_empno}"/>
			                <div class="form-group">
			                  <input class="form-control" placeholder="To:" value="${post.name}" readonly/>
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
			                  <button class="btn btn-default" type="button" onclick="location.href='./postGetList.go'">
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
function setEmpInfo(emp_no, name) {
	$("#sendForm input[name=get_empno]").val(emp_no);
	var empInfo = name + " (" + emp_no + ")";
	$("#getEmpInfo").val(empInfo);
}

function validateForm() {
	   var subject = document.getElementById('subject').value;
	   var content = document.getElementById('compose-textarea').value;
	   
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