<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h3{
	text-align: center;
}

th{
	text-align: center;
}

.btn btn-primary{
	text-align: center;
}

</style>
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
		<h3>신규직원 인적 정보 작성</h3>
		<form action="empJoin.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
			<table class="table table-dark table-striped">
				<tr>
					<th>
						<img src="img/GroupFit_lg_2.png" alt="그룹핏"
							 width="90px" height="90px" onerror="this.src='img/GroupFit_lg_2.png'"/>
					</th>
					<td>
						<input type="file" name="file" multiple="multiple" onchange="previewImage(this)"/>
						<img id="preview" style="max-width: 200px; max-height: 200px;">
					</td>
				</tr>
				<tr>
					<th>*사내번호</th>
					<td><input type="text" name="emp_no" id="emp_no"/></td>
				</tr>
				<tr>
					<th>*비밀번호</th>
					<td><input type="password" name="pw" id="pw"/></td>
				</tr>
				<tr>
					<th>*이름</th>
					<td><input type="text" name="name" id="name"/></td>
				</tr>
				<tr>
					<th>*성별</th>
					<td>
						<input type="radio" value="남" name="gender" id="gender"/>남
						<input type="radio" value="여" name="gender" id="gender"/>여
					</td>
				</tr>
				<tr>
					<th>*생년월일</th>
					<td><input type="date" name="birth" id="birth"/></td>
				</tr>
				<tr>
					<th>*연락처</th>
					<td><input type="text" name="phone" id="phone"/></td>
				</tr>
				<tr>
					<th>*이메일</th>
					<td><input type="email" name="email" id="email"/></td>
				</tr>
				<tr>
					<th>*지점</th>
					<td>
						<select name="b_idx" id="b_idx">
						    <option value="1">서초</option>
						    <option value="2">방배</option>
						    <option value="3">역삼</option>
						    <option value="4">논현</option>
						</select>			
					</td>
				</tr>
				<tr>
					<th>*직급</th>
					<td>
						<select name="position" id="position">
						    <option value="직원">직원</option>
						    <option value="지점장">지점장</option>
						    <option value="대표">대표</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>*재직상태</th>
					<td>
						<select name="status" id="status">
						    <option value="재직">재직</option>
						    <option value="휴직">휴직</option>
						    <option value="퇴직">퇴직</option>
						</select>			
					</td>
				</tr>
				<tr>
					<th>*입사일자</th>
					<td><input type="date" id="join_year" name="join_year"/></td>
				</tr>
				<input class="btn btn-primary" type="submit" value="등록"/>
				<button class="btn btn-primary" type="button" onclick="location.href='./empList.go'">목록</button>	
			</table>

		</form>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

var now = new Date();
document.getElementById('join_year').valueAsDate = now;

function previewImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#preview').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
  
function validateForm() {
	   var emp_no = document.getElementById('emp_no').value;
	   var pw = document.getElementById('pw').value;
	   var name = document.getElementById('name').value;
	   var gender = document.getElementById('gender').value;
	   var birth = document.getElementById('birth').value;
	   var phone = document.getElementById('phone').value;
	   var email = document.getElementById('email').value;
	   var b_idx = document.getElementById('b_idx').value;
	   var position = document.getElementById('position').value;
	   var status = document.getElementById('status').value;
	   var join_year = document.getElementById('join_year').value;
	   
	   if (emp_no.trim() == '') {
	      alert('사내번호를 입력해주세요.');
	      return false;
	   }
	   
	   if (pw.trim() == '') {
	      alert('비밀번호를 입력해주세요.');
	      return false;
	   }
	   if (name.trim() == '') {
	      alert('이름을 입력해주세요.');
	      return false;
	   }
	   if (gender == '') {
	      alert('성별을 입력해주세요.');
	      return false;
	   }
	   if (birth.trim() == '') {
	      alert('생년월일을 입력해주세요.');
	      return false;
	   }
	   if (phone.trim() == '') {
	      alert('연락처를 입력해주세요.');
	      return false;
	   }
	   if (email.trim() == '') {
	      alert('이메일을 입력해주세요.');
	      return false;
	   }
	   if (b_idx.trim() == '') {
	      alert('지점을 입력해주세요.');
	      return false;
	   }
	   if (position.trim() == '') {
	      alert('지점을 입력해주세요.');
	      return false;
	   }
	   if (status.trim() == '') {
	      alert('재직상태를 입력해주세요.');
	      return false;
	   }
	   if (join_year.trim() == '') {
	      alert('입사일를 입력해주세요.');
	      return false;
	   }
	   
	   return true;
	}
</script>
</html>