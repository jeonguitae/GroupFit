<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<body>
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>

	<div class="content-wrapper" style="margin-top: 57.08px">
		<h3>직원 프로필 수정하기</h3>
		<form action="empUpdate.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<input type="file" name="emp_photo"/>
				</tr>
				<tr>
					<th>*사내번호</th>
					<td><input type="text" name="emp_no" value="${emp.emp_no}" readonly /></td>
				</tr>
				<tr>
					<th>*비밀번호</th>
					<td><input type="text" name="pw" value="${emp.pw}" /></td>
				</tr>
				<tr>
					<th>*이름</th>
					<td><input type="text" name="name" value="${emp.name}" /></td>
				</tr>
				<tr>
					<th>*성별</th>
					<td>
						<input type="radio" value="남" name="gender"
						<c:if test="${emp.gender eq '남'}">checked</c:if>
						 />남
						
						<input type="radio" value="여" name="gender"
						<c:if test="${emp.gender eq '여'}">checked</c:if>
						 />여
					</td>
				</tr>
				<tr>
					<th>*생년월일</th>
					<td><input type="date" name="birth" value="${emp.birth}" /></td>
				</tr>
				<tr>
					<th>*연락처</th>
					<td><input type="text" name="phone" value="${emp.phone}" /></td>
				</tr>
				<tr>
					<th>*이메일</th>
					<td><input type="email" name="email" value="${emp.email}" /></td>
				</tr>
				<tr>
					<th>*지점번호</th>
					<td>
						<select name="b_idx" >
						    <option value="1" <c:if test="${emp.b_idx eq '1'}">selected="selected"</c:if> >서초</option>
						    <option value="2" <c:if test="${emp.b_idx eq '2'}">selected="selected"</c:if> >방배</option>
						    <option value="3" <c:if test="${emp.b_idx eq '3'}">selected="selected"</c:if> >역삼</option>
						    <option value="4" <c:if test="${emp.b_idx eq '4'}">selected="selected"</c:if> >논현</option>
						</select>			
					</td>
				</tr>
				<tr>
					<th>*직급</th>
					<td>
						<select name="position">
						    <option value="직원" <c:if test="${emp.position eq '직원'}">selected="selected"</c:if> >직원</option>
						    <option value="지점장" <c:if test="${emp.position eq '지점장'}">selected="selected"</c:if> >지점장</option>
						    <option value="대표" <c:if test="${emp.position eq '대표'}">selected="selected"</c:if > >대표</option>
						</select>
					
					</td>
				</tr>
				<tr>
					<th>*재직상태</th>
					<td>
					<select name="status">
					    <option value="재직" <c:if test="${emp.status eq '재직'}">selected="selected"</c:if> >재직</option>
					    <option value="휴직" <c:if test="${emp.status eq '휴직'}">selected="selected"</c:if> >휴직</option>
					    <option value="퇴직" <c:if test="${emp.status eq '퇴직'}">selected="selected"</c:if> >퇴직</option>
					</select>	
					
					</td>
				</tr>
				<tr>
					<th>*입사일자</th>
					<td><input type="date" name="join_year" value="${emp.join_year}" /></td>
				</tr>
				<input type="submit" value="등록"/>
				<button type="button" onclick="location.href='./empList.go'">목록</button>	
				<button type="button" onclick="location.href='./empDelete.do?detailid=${emp.emp_no}'">삭제</button>
			</table>
		</form>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>