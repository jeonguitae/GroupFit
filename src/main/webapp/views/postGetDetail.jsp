<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지 상세보기</title>
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
						<h1>받은 쪽지 상세보기</h1>
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
<%-- 					<table>
						<tr>
							<th>받은시간</th>
							<td><input type="text" value="${post.send_time}" readonly/></td>
						</tr>
						<tr>
							<th>읽은시간</th>
							<td><input type="text" value="${post.chk_time}" readonly/></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject" value="${post.subject}" readonly/></td>
						</tr>
						<tr>
							<th>보낸사람 이름</th>
							<td>
								<input type="text" name="get_empno" value="${post.name}" readonly/>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="content" readonly>${post.content}</textarea> 
							</td>
						</tr>
						<button type="button" onclick="location.href='./postGetWrite.go?emailid=${post.email_num}'">회신</button>	
						<button type="button" onclick="location.href='./postSendList.go'">보낸쪽지 목록</button>	
						<button type="button" onclick="location.href='./postGetList.go'">받은쪽지 목록</button>	
					</table> --%>
				<div class="card card-primary card-outline">
		            <div class="card-header">
		              <h3 class="card-title" >${post.subject}</h3>
		              <div class="card-tools">
		                <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
		                <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
		              </div>
		            </div>
		            <!-- /.card-header -->
		            <div class="card-body p-0">
		              <div class="mailbox-read-info">
		                <br>
		                <h6>보낸사람 이름: ${post.name}</h6> </br>
		                <h6>받은 시간: ${post.send_time}</h6> </br>
		                <h6>읽은 시간: ${post.chk_time}</h6>
		              </div>
		              <!-- /.mailbox-read-info -->

		              
		              <div class="mailbox-read-message">
		              	${post.content}
		              </div>
		              <!-- /.mailbox-read-message -->
		            </div>
		            <!-- /.card-footer -->
		            <div class="card-footer">
		              <div class="float-right">
		                <button type="button" class="btn btn-default"
		                		onclick="location.href='./postGetWrite.go?emailid=${post.email_num}'">
		                		<i class="fas fa-share"></i>회신</button>	
		                <button type="button" class="btn btn-default"
		                		onclick="location.href='./postSendList.go'"><i class="fas fa-share"></i>보낸쪽지</button>
		                <button type="button" class="btn btn-default"
		                		onclick="location.href='./postGetList.go'"><i class="fas fa-share"></i>받은쪽지</button>
		              </div>
		            </div>
		            <!-- /.card-footer -->
		          </div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>
</script>
</html>