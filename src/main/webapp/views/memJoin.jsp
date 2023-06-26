<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>
	<div class="content-wrapper" style="margin-top:57.08px">
	<form action="memjoin.do" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
<<<<<<< HEAD
				<th>�������</th>
				<td><input type="text" name="birth"/></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="text" name="phone"/></td>
			</tr>
			<tr>
				<th>������ȣ</th>
				<td><input type="text" name="user_number"/></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td><input type="email" name="email"/></td>
			</tr>
			<tr>
				<th>�������</th>
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
				<th>�����</th>
=======
				<th>생년월일</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="male"/>남자
					&nbsp; &nbsp;
					<input type="radio" name="female"/>여자
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="number" name="phone"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<th>����</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>��Ŀ��뿩��</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>�����뿩��</th>
				<td>
					<input type="radio" value="��" name="gender"/>��
					<input type="radio" value="��" name="gender"/>��
				</td>
			</tr>
			<tr>
				<th>�̿�ǱⰣ</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>�����ݾ�</th>
				<td><input type="password" name="pw"/></td>
			</tr>
		</table>
		<button>ȸ������</button>
	</form>
	</div>
</body>
</html>