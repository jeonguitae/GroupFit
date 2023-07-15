<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

	#aAp{
		margin-left: 70px;
		margin-top: 20px;
	}	

	#table1 {
		border: 1px solid black;
		border-collapse: collapse;
		float: left;
		margin-top: 5%;
		margin-left: 5%;
		position:absolute;
	}
	#table1 th{
		border: 1px solid black;
	    padding: 10px;
		white-space: nowrap;
	}
	#table1 td{
		border: 1px solid black;
	    padding: 10px;
	}
	
	
	
	#table2{
		border: 1px solid black;
	    border-collapse: collapse;
	    margin-top: 15%;
	    margin-left: 5%;
	    position: absolute;
	    width: 70%;
	}
	#table2 th{
		border: 1px solid black;
		padding: 10px;
		white-space: nowrap;
	}
	#table2 td{
		border: 1px solid black;
		padding: 10px;
	}
	
	
	
	#table3{
		border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    text-align: center;
	    width: 30%;
	    float: right;
	    margin-right: 9%;
	    margin-top: 2%;
	}
	
	#table3 th {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px;
	    text-align: center;
	}
	
	#table3 td {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    width: 100px;
	    text-align: center;
	}
	#table3_1{
		border: 1px solid black;
	    border-collapse: collapse;
	    float: right;
	    margin-right: 9%;
	    margin-top: 2%;
	    text-align: center;
	    width: 20%;
	}
	
	#table3_1 th {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px;
	    text-align: center;
	}
	
	#table3_1 td {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    text-align: center;
	    width: 40%;
	}
	
	#tr22{
		height: 100px;
		vertical-align: bottom;
	}
	
	#tr11{
		vertical-align: middle;
	}
	
	#tr2{
		height: 100px;
		vertical-align: bottom;
	}
	#tr1{
		vertical-align: middle;
	}
	
	#button_sin_mok {
	    margin-top: 35%;
	    position: absolute;
	    margin-left: 30%;
	}

	textarea {
   		width: 60%;
   		height: 30%;
	}
	
	#accept{
		PADDING-RIGHT: 3%;
		PADDING-BOTTOM: 2%;
	}

</style>
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
						<h1>결재 문서함</h1>
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
				<c:if test="${position eq '지점장' or position eq '대표'}">
					<form action="approvalAccept.do?a_idx=${dto.a_idx}&approval=${dto.approval}">
						<table id="table1">
							<tr>
								<th>기안자</th>
								<td>${dto.name}</td>
							</tr>
							<tr>
								<th>기안일</th>
								<td>${dto.write_date }</td>
							</tr>
							<tr>
								<th>결재구분</th>
								<td>${dto.approval }</td>
							</tr>
						</table>
						
						<c:if test="${dto.position eq 'FC' or dto.position eq '트레이너'}">
							<table id="table3">
								<tr id="tr1">
									<th rowspan="4">신청</th>
									<th>직원</th>
									<th rowspan="4">결재</th>
									<th>지점장</th>
									<th>대표</th>
								</tr>
								<tr id="tr2">
									<td>
										<c:if test="${dto.state eq '대기' or dto.state eq '예정' or dto.state eq '승인'}">
											<img id="accept" src="img/success.png">
										</c:if>
										${dto.name}
									</td>
									<td>
										<c:if test="${dto.state eq '예정' or dto.state eq '승인'}">
											<img id="accept" src="img/success.png">
										</c:if>
										${dto.manager}
									</td>
									<td>
										<c:if test="${dto.state eq '승인'}">
											<img id="accept" src="img/success.png">
										</c:if>
										${dto.top_manager}
									</td>
								</tr>
							</table>
						</c:if>	
						
						<c:if test="${dto.position eq '지점장'}">
							<table id="table3_1">
								<tr id="tr11">
									<th rowspan="3">신청</th>
									<th>지점장</th>
									<th rowspan="3">결재</th>
									<th>대표</th>
								</tr>
								<tr id="tr22">
									<td>${dto.name}</td>
									<td>${dto.top_manager }</td>
								</tr>
							</table>
						</c:if>	
						
					<table id="table2">
						<tr>
							<th>제목</th>
							<td>${dto.subject }</td>
						</tr>
						<tr>
							<th>기간</th>
							<td>${dto.start_day}~${dto.finish_day}</td>
						</tr>
						<tr>
							<th>사유</th>
							<td>${dto.reason}</td>
						</tr>
						<tr>
							<th>기타사항</th>
							<td>${dto.etc}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<c:if test="${empty list}">
									첨부파일이 없습니다...
								</c:if>	
								<c:forEach items="${list }" var="files">
									<a href="download.do?path=${files.new_photo_name}&idx=${files.board_num}">${files.ori_photo_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
							</td>
						</tr>
					</table>
					
					<div id="button_sin_mok">
						<input type="hidden" name="a_idx" value="${dto.a_idx}"/>
						<input type="hidden" name="approval" value="${dto.approval}"/>
						<button>승인</button>
						<button type="button" id="mok" onclick="location.href='approvalAllList.do'">목록</button>
					</div>
			</form>
		</c:if>
		<c:if test="${dto.emp_no eq loginId }">
				<form action="approvalUpdate.go?a_idx=${dto.a_idx}&approval=${dto.approval}">
				
					<table id="table1">
						<tr>
							<th>기안자</th>
							<td>${dto.name}</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td>${dto.write_date }</td>
						</tr>
						<tr>
							<th>결재구분</th>
							<td>${dto.approval }</td>
						</tr>
					</table>
					
					<c:if test="${dto.position eq 'FC' or dto.position eq '트레이너'}">
						<table id="table3">
							<tr id="tr1">
								<th rowspan="4">신청</th>
								<th>직원</th>
								<th rowspan="4">결재</th>
								<th>지점장</th>
								<th>대표</th>
							</tr>
							<tr id="tr2">
								<td>
									<c:if test="${dto.state eq '대기' or dto.state eq '예정' or dto.state eq '승인'}">
										<img id="accept" src="img/success.png">
									</c:if>
									${dto.name}
								</td>
								<td>
									<c:if test="${dto.state eq '예정' or dto.state eq '승인'}">
										<img id="accept" src="img/success.png">
									</c:if>
									${dto.manager}
								</td>
								<td>
									<c:if test="${dto.state eq '승인'}">
										<img id="accept" src="img/success.png">
									</c:if>
									${dto.top_manager}
								</td>
							</tr>
						</table>
					</c:if>	
					
					<c:if test="${dto.position eq '지점장'}">
						<table id="table3_1">
							<tr id="tr11">
								<th rowspan="3">신청</th>
								<th>지점장</th>
								<th rowspan="3">결재</th>
								<th>대표</th>
							</tr>
							<tr id="tr22">
								<td>
									<c:if test="${dto.state eq '예정' or dto.state eq '승인'}">
										<img id="accept" src="img/success.png">
									</c:if>
									${dto.name}
								</td>
								<td>
									<c:if test="${dto.state eq '승인'}">
										<img id="accept" src="img/success.png">
									</c:if>
									${dto.top_manager}
								</td>
							</tr>
						</table>
					</c:if>	
					
				<table id="table2">
					<tr>
						<th>제목</th>
						<td>${dto.subject }</td>
					</tr>
					<tr>
						<th>기간</th>
						<td>${dto.start_day}~${dto.finish_day}</td>
					</tr>
					<tr>
						<th>사유</th>
						<td>${dto.reason}</td>
					</tr>
					<tr>
						<th>기타사항</th>
						<td>${dto.etc}</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<c:if test="${empty list}">
								첨부파일이 없습니다...
							</c:if>	
							<c:forEach items="${list }" var="files">
								<a href="download.do?path=${files.new_photo_name}&idx=${files.board_num}">${files.ori_photo_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</td>
					</tr>
				</table>
				<div id="button_sin_mok">
					<c:if test="${dto.state eq '대기'}">
						<button id="su">수정</button>
						<input type="hidden" name="a_idx" value="${dto.a_idx}"/>
						<input type="hidden" name="approval" value="${dto.approval}"/>
						<input type="hidden" name="write_date" value="${dto.write_date}"/>
						<input type="hidden" name="manager" value="${dto.manager}"/>
						<input type="hidden" name="top_manager" value="${dto.top_manager}"/>
					</c:if>
					<button type="button" id="mok" onclick="location.href='approvalAllList.do'">목록</button>
				</div>
		</form>
	</c:if>
	</div>	
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script type="text/javascript">
</script>
</html>