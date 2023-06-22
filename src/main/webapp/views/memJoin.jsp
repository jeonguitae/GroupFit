<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memjoin.do" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth"/></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<th>고유번호</th>
				<td><input type="text" name="user_number"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email"/></td>
			</tr>
			<tr>
				<th>등록지점</th>
				<td>
					 <label for="lang">Language</label>
					  <select name="languages" id="lang">
					    <option value="javascript">JavaScript</option>
					    <option value="php">PHP</option>
					    <option value="java">Java</option>
					    <option value="golang">Golang</option>
					    <option value="python">Python</option>
					    <option value="c#">C#</option>
					    <option value="C++">C++</option>
					    <option value="erlang">Erlang</option>
					  </select>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" value="남" name="gender"/>남
					<input type="radio" value="여" name="gender"/>여
				</td>
			</tr>
			<tr>
				<th>라커사용여부</th>
				<td>
					<input type="radio" value="여" name="gender"/>여
					<input type="radio" value="부" name="gender"/>부
				</td>
			</tr>
			<tr>
				<th>운동복사용여부</th>
				<td>
					<input type="radio" value="여" name="gender"/>여
					<input type="radio" value="부" name="gender"/>부
				</td>
			</tr>
			<tr>
				<th>이용권기간</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><input type="password" name="pw"/></td>
			</tr>
		</table>
		<button>회원가입</button>
	</form>


</body>
</html>