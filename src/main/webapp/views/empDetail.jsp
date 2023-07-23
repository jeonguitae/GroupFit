<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.empBtn{
	text-align: center;
}
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>

	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content">
        <div class="container-fluid">
		<h3>직원 프로필 상세보기</h3>
			<div class="container">
				<div class="row mb-3">
					   <label for="name" class="col-sm-2 col-form-label">
						직원 사진
						</label>
					   <div class="col-sm-10">
						<c:choose>
		                 <c:when test="${not empty emp.new_photo_name}">
		                     <img width="90px" height="90px" src="/photo/${emp.new_photo_name}">
		                 </c:when>
		                 <c:otherwise>
		                     <img width="90px" height="90px" src="img/GroupFit_lg_2.png" />
		                 </c:otherwise>
		           		</c:choose>
					   </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*사내번호</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="emp_no" value="${emp.emp_no }" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*이름</label>
					  <div class="col-sm-10">
					    <input  class="form-control"type="text" name="name" value="${emp.name}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*성별</label>
					  <div class="col-sm-10">
					  	<input type="radio" value="남" name="gender"
						<c:if test="${emp.gender eq '남'}">checked</c:if>
						 readonly/>남
						<input type="radio" value="여" name="gender"
						<c:if test="${emp.gender eq '여'}">checked</c:if>
						 readonly/>여
					  </div>
				</div>
<%-- 				<tr>
					<th>*성별</th>
					<td>
						<input type="radio" value="남" name="gender"
						<c:if test="${emp.gender eq '남'}">checked</c:if>
						 readonly/>남
						
						<input type="radio" value="여" name="gender"
						<c:if test="${emp.gender eq '여'}">checked</c:if>
						 readonly/>여
					</td>
				</tr> --%>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*생년월일</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="birth" value="${emp.birth}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*연락처</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="phone" value="${emp.phone}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*이메일</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="email" name="email" value="${emp.email}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*지점</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="b_name" value="${emp.b_name}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*직급</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="position" value="${emp.position}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*재직상태</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="status" value="${emp.status}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*재직상태</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="status" value="${emp.status}" readonly/>
					  </div>
				</div>
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*입사일자</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="join_year" value="${emp.join_year}" readonly/>
					  </div>
				</div>
				<c:if test="${emp.status eq '퇴직'}">
				<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*퇴사일자</label>
					  <div class="col-sm-10">
					    <input class="form-control" type="text" name="retire_year" value="${emp.retire_year}" readonly/>
					  </div>
				</div>
				</c:if>
				<br>
				<div class="empBtn">
				<button type="button" class="btn btn-primary" onclick="location.href='./empUpdate.go?detailid=${emp.emp_no}'">수정</button>
				<button type="button" class="btn btn-danger" onclick="location.href='./empDelete.do?detailid=${emp.emp_no}'">삭제</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='./empList.go'">목록</button>
				</div>	
			</table>
			</div>
		</div>
		</section>
		</div>
</body>
<script>
</script>
</html>