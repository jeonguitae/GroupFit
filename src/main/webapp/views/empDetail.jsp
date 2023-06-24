<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>직원 프로필 상세보기</h3>
		<table>
			<tr>
				<input type="file" name="emp_photo"/>
			</tr>
			<tr>
				<th>*사내번호</th>
				<td><input type="text" name="emp_no" value="${emp.emp_no }" readonly/></td>
			</tr>
			<tr>
				<th>*비밀번호</th>
				<td><input type="text" name="pw" value="${emp.pw}" readonly/></td>
			</tr>
			<tr>
				<th>*이름</th>
				<td><input type="text" name="name" value="${emp.name}" readonly/></td>
			</tr>
			<tr>
				<th>*성별</th>
				<td>
					<input type="radio" value="남" name="gender"
					<c:if test="${emp.gender eq '남'}">checked</c:if>
					 readonly/>남
					
					<input type="radio" value="여" name="gender"
					<c:if test="${emp.gender eq '여'}">checked</c:if>
					 readonly/>여
				</td>
			</tr>
			<tr>
				<th>*생년월일</th>
				<td><input type="text" name="birth" value="${emp.birth}" readonly/></td>
			</tr>
			<tr>
				<th>*연락처</th>
				<td><input type="text" name="phone" value="${emp.phone}" readonly/></td>
			</tr>
			<tr>
				<th>*이메일</th>
				<td><input type="email" name="email" value="${emp.email}" readonly/></td>
			</tr>
			<tr>
				<th>*지점번호</th>
				<td><input type="text" name="b_idx" value="${emp.b_idx}" readonly/></td>
			</tr>
			<tr>
				<th>*직급</th>
				<td><input type="text" name="position" value="${emp.position}" readonly/></td>
			</tr>
			<tr>
				<th>*계약기간</th>
				<td>
					<input type="text" name="start_conterm" value="${emp.start_conterm}" readonly/>부터
					<input type="text" name="end_conterm" value="${emp.end_conterm}" readonly/>까지
				</td>
			</tr>
			<tr>
				<th>*재직상태</th>
				<td><input type="text" name="status" value="${emp.status}" readonly/></td>
			</tr>
			<tr>
				<th>*입사일자</th>
				<td><input type="text" name="join_year" value="${emp.join_year}" readonly/></td>
			</tr>
			<button type="button" onclick="location.href='./empUpdate.go?detailid=${emp.emp_no}'">수정</button>
			<button type="button" onclick="location.href='./list.do'">목록</button>	
			<button type="button" onclick="location.href='./empDelete.do?detailid=${emp.emp_no}'">삭제</button>	
		</table>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>