<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>신규직원 인적 정보 작성</h3>
	<form action="empJoin.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<input type="file" name="emp_photo"/>
			</tr>
			<tr>
				<th>*사내번호</th>
				<td><input type="text" name="emp_no"/></td>
			</tr>
			<tr>
				<th>*비밀번호</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>*이름</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<th>*성별</th>
				<td>
					<input type="radio" value="남" name="gender"/>남
					<input type="radio" value="여" name="gender"/>여
				</td>
			</tr>
			<tr>
				<th>*생년월일</th>
				<td><input type="date" name="birth"/></td>
			</tr>
			<tr>
				<th>*연락처</th>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<th>*이메일</th>
				<td><input type="email" name="email"/></td>
			</tr>
			<tr>
				<th>*지점번호</th>
				<td>
					<select name="b_idx">
					    <option value="지점1">지점1</option>
					    <option value="지점2">지점2</option>
					    <option value="지점3">지점3</option>
					    <option value="지점4">지점4</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th>*직급</th>
				<td>
					<select name="position">
					    <option value="직원">직원</option>
					    <option value="지점장">지점장</option>
					    <option value="대표">대표</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th>*계약기간</th>
				<td><input type="date" name="conterm"/></td>
			</tr>
			<tr>
				<th>*재직상태</th>
				<td>
					<select name="status">
					    <option value="재직">재직</option>
					    <option value="휴직">휴직</option>
					    <option value="퇴직">퇴직</option>
					</select>			
				</td>
			</tr>
			<tr>
				<th>*입사일자</th>
				<td><input type="date" name="join_year"/></td>
			</tr>
			<input type="submit" value="등록"/>
			<button type="button" onclick="location.href='./boardList.do'">목록</button>	
		</table>
	</form>
</body>
<script>

</script>
</html>