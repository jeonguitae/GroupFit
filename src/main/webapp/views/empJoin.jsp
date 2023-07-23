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

.empBtn{
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
	      <section class="content">
         <div class="container-fluid">
		<h3>신규직원 인적 정보 작성</h3>
		<form action="empJoin.do" method="post" enctype="multipart/form-data" onsubmit="return valiJoinForm()">
			<div class="container">
					<div class="row mb-3">
					   <label for="name" class="col-sm-2 col-form-label">
					   	<img src="img/GroupFit_lg_2.png" alt="그룹핏"
								 width="90px" height="90px" onerror="this.src='img/GroupFit_lg_2.png'"/>
						</label>
					   <div class="col-sm-10">
					     <input type="file" name="file" multiple="multiple" onchange="previewImage(this)"/>
						 <img id="preview" style="max-width: 200px; max-height: 200px;">
					   </div>
					 </div>
					 <div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*비밀번호</label>
					  <div class="col-sm-10">
					    <input type="password" class="form-control" name="pw" id="pw"/>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*이름</label>
					  <div class="col-sm-10">
					    <input type="text" class="form-control" name="name" id="name"/>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">성별</label>
					  <div class="col-sm-10">
					    <div class="form-check form-check-inline">
					      <input class="form-check-input" type="radio" name="gender" value="남">
					      <label class="form-check-label" for="inlineRadio1">남자</label>
					    </div>
					    <div class="form-check form-check-inline">
					      <input class="form-check-input" type="radio" name="gender" value="여" id="gender">
					      <label class="form-check-label" for="inlineRadio2">여자</label>
					    </div>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*생년월일</label>
					  <div class="col-sm-10">
					    <input type="date" class="form-control" name="birth" id="birth"/>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*연락처</label>
					  <div class="col-sm-10">
					    <input type="text" class="form-control" name="phone" id="phone"/>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*이메일</label>
					  <div class="col-sm-10">
					    <input type="email" class="form-control" name="email" id="email"/>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*지점</label>
					  <div class="col-sm-10">
					    	<select name="b_idx" id="b_idx">
							    <option value="1">서초</option>
							    <option value="2">강남</option>
							    <option value="3">역삼</option>
							    <option value="4">논현</option>
							</select>	
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*직급</label>
					  <div class="col-sm-10">
							<select name="position" id="position">
							    <option value="FC">FC</option>
							    <option value="트레이너">트레이너</option>
							    <option value="지점장">지점장</option>
							    <option value="대표">대표</option>
							</select>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*재직상태</label>
					  <div class="col-sm-10">
							<select name="status" id="status">
							    <option value="재직">재직</option>
							    <option value="휴직">휴직</option>
							    <option value="퇴직">퇴직</option>
							</select>	
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="name" class="col-sm-2 col-form-label">*입사일자</label>
					  <div class="col-sm-10">
					    <input type="date" class="form-control" id="join_year" name="join_year"/>
					  </div>
					</div>
					<div class="empBtn">
					<input class="btn btn-primary" type="submit" value="등록"/>
					<button class="btn btn-primary" type="button" onclick="location.href='./empList.go'">목록</button>
					</div>	
				</table>
				</div>
		</form>
	</div>
	</section>
	</div>
</body>
<script>

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
  
function valiJoinForm() {
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
	   
	   if (pw.trim() == '') {
	      alert('비밀번호를 입력해주세요.');
	      return false;
	   }
	   if (pw.length < 8) {
		   alert('비밀번호는 8자리 이상 입력해주세요!');
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

$('#idChk').on('click',function(e){
    
    var emp_no = $('#emp_no').val();
    
    $.ajax({
       type:'post',
       url:'idChk.ajax',
       data:{emp_no:emp_no},
       dataType:'json',
       success:function(data){
          if(data.idChk == 0){
             console.log('사용 가능한 사내번호');
             $('#msg').css({'font-size':'8px', 'color':'darkgreen'});
             $('#msg').html('사용 가능한 사내번호 입니다.');
             overlayChk = true;
          }else{
             console.log('이미 사용 중인 사내번호');
             $('#msg').css({'font-size':'8px', 'color':'red'});
             $('#msg').html('이미 사용 중인 사내번호 입니다.');
          }
       },
       error:function(e){
          console.log(e);
       }
    });
});
</script>
</html>