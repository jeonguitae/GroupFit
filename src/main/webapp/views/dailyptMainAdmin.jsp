<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pt 회원 일지</title>
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
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>pt 회원 일지 리스트</h1>
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
						<div class = "float-left">
							<div id="branchFilter">
									  <select name="branch" id="branch" style = "margin-left : 30px">
									  	<option value="listAll">전체</option>
							            <c:forEach items="${dailyptlist}" var="item">
							               <option value="${item.emp_no}">${item.emp_name}</option>
							               <option value="${item.emp_no}">${item.emp_name}</option>
							            </c:forEach>
							           </select>
							  
							</div>
							</div>
							<div class="float-right">
								<c:if test="${sessionScope.loginEmp.position eq '트레이너' }">
								<button class="btn btn-primary" onclick="location.href='dailypt.go'">일지 등록</button>&nbsp; 
								<form id="deleteForm" action="dailyptdelete.do" method="post">
								  <input type="hidden" name="dailypt_no" id="dailypt_no" value="">
								  <button class="btn btn-danger" onclick="deleteSelectedRows()">일지 삭제</button>
								</form>
								</c:if>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">일지 리스트</h4>
							</div>
							<div class="card-body">
								<c:if test="${dailyptlist.size() > 0}">
									<table class="table">
										<thead class="table-light">
											<tr>
												<th>no</th>
												<th>이름</th>
												<th>회원번호</th>
												<th>운동일자</th>
												<th>트레이너</th>
												 <th>
										            <input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes()">
										        </th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${dailyptlist}" var="daily_pt"
												varStatus="status">

												<tr>
													<td>${daily_pt.dailypt_no}</td>
													<td><a href="dailyPtDetail.do?dailypt_no=${daily_pt.dailypt_no}">${daily_pt.member_name}</a></td>
													<td>${daily_pt.mem_no}</td>
													<td>${daily_pt.pt_date}</td>
													<td>${daily_pt.emp_name}</td>
													<td><input type="checkbox" class="rowCheckbox" name="deleteRow[]" value="${daily_pt.dailypt_no}"></td>
												</tr>

											</c:forEach>

											<c:if test="${empty dailyptlist}">
												<tr class="empty-data">
													<td colspan="4">데이터가 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</c:if>
								<c:if test="${dailyptlist.size() == 0}">
									<div style="text-align: center;">등록한 일지가 없습니다. 일지를 등록해
										주세요.</div>
								</c:if>
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
	function toggleAllCheckboxes() {
		const checkboxes = document.getElementsByClassName('rowCheckbox');
		const selectAllCheckbox = document.getElementById('selectAll');
		for (let i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = selectAllCheckbox.checked;
		}
	}

	function deleteSelectedRows() {
		  const checkboxes = document.getElementsByClassName('rowCheckbox');
		  const deleteForm = document.getElementById('deleteForm');
		  const dailyptNoInput = document.getElementById('dailypt_no');
		  
		  // 선택된 행의 dailypt_no 값을 배열로 저장
		  const selectedRows = [];
		  for (let i = 0; i < checkboxes.length; i++) {
		    if (checkboxes[i].checked) {
		      selectedRows.push(checkboxes[i].value);
		    }
		  }
		  
		  // 선택된 dailypt_no 값을 hidden input에 설정
		  dailyptNoInput.value = selectedRows.join(',');
		  
		  // form을 제출하여 서버로 데이터 전송
		  deleteForm.submit();
		}

	

	  
	
</script>
</html>
