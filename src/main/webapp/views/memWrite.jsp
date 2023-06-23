<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>회원정보 등록</title>
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
   <jsp:include page="GroupFit_gnb.jsp" />
   <div class="content-wrapper" style="margin-top: 57.08px">
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
         	<form action="memjoin.do" method="post">
         		<h2>회원정보 등록</h2>
	         	<table>
	         		<tr>
	         			<th>이름</th>
	         				<td>
	         					<input type="text" name="name" value=""/>
	         				</td>
	         		</tr>
	         		
	         		<tr>
	         			<th>생년월일</th>
	         				<td>
	         					<input type="date" name="birth">
	         				</td>
	         		</tr>
	         		
	         		<tr>
	         			<th>성별</th>
	         				<td>
	         					<input type="radio" name="gender" value="남자"/>남자
	         					&nbsp; &nbsp; &nbsp; &nbsp;
	         					<input type="radio" name="gender" value="여자"/>여자
	         				</td>
	         		</tr>
	         		
	         		<tr>
	         			<th>연락처</th>
	         				<td>
	         					<input type="text" name="phone" value=""/>
	         				</td>
	         		</tr>
	         	</table>
	         	
	         	<hr/>
	         	
	         	<h2>이용권 등록</h2>
	         	<table>
					<tr>
						<th>이용권</th>
							<td>
								<select name="ticket">
									<c:forEach items="${ticket}" var="name">
										<option value="${name.ticket_name}">${name.ticket_name}
									</c:forEach>
								</select>
							</td>
					</tr>
					
					<tr>
						<th>판매자</th>
						<td>
							<input type="text" name="emp_no" value="${emp_name}" readonly="readonly"/>
						</td>
					</tr>
					
					<tr>
						<th>회원번호</th>
					</tr>
					
					<tr>
						<th>이용권 시작일자</th>
					</tr>
					
					<tr>
						<th>지점</th>
							<td>
								<select name="branch">
									<c:forEach items="${branch}" var="name">
										<option value="${name.b_name}">${name.b_name}
									</c:forEach>
								</select>
							</td>
					</tr>
				</table>
					<input type="submit" onclick="location.href='/memjoin.do'" value="등록">
					<input type="button" onclick="location.href='/memlist.go'" value="이전">
			</form>
         </div>
         <!--/. container-fluid -->
      </section>
   </div>
</body>
<script>
	
</script>
</html>