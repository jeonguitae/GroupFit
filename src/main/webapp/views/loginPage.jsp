<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>GroupFit loginPage</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<!-- Modal -->
	<div class="modal fade" id="joinModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">회원가입</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="text-align: left">
					<div style="text-align: center"><span style="color: red;font-weight: 700">
					본 팝업창은 테스트를 위한 임시 용도입니다.</span></div><p/>
					<form class="validation-form" action="tempJoin.do" method="post"
						novalidate>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">사번</label> <input type="text" name="emp_no"
									class="form-control" id="name" placeholder="" value="" required>
								<div class="invalid-feedback">사번을 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="nickname">이름</label> <input type="text"
									name="name" class="form-control" id="nickname"
									placeholder="" value="" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="email">이메일</label> <input type="email" name="email"
								class="form-control" id="email" placeholder="you@example.com"
								required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>

						<div class="mb-3">
							<label for="pw">패스워드</label> <input type="password" name="pw"
								class="form-control" id="pw" required>
							<div class="invalid-feedback">패스워드를 입력해주세요.</div>
						</div>

						<div class="mb-3">
							<label for="pw2">패스워드 확인</label> <input type="password"
								name="pwValid" class="form-control" id="pw2" required>
							<div class="invalid-feedback">패스워드 확인을 입력해주세요.</div>
							<div id="pwValidMsg"
								style="display: none; color: #dc3545; font-size: 80%; margin-top: 4px;">패스워드가 일치하지 않습니다.</div>
						</div>
						
						<div class="mb-3">
							<label for="pw">연락처</label> <input type="text" name="phone"
								class="form-control" id="pw" required>
						</div>
						
						<div class="mb-3">
							<label for="position">직급</label> <select
							class="form-select" name="position" id="position">
							<option value="트레이너">트레이너</option>
							<option value="FC">FC</option>
							<option value="지점장">지점장</option>
							<option value="대표">대표</option>
						</select>
						</div>

						<hr class="mb-4"><div style="text-align: center">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="aggrement" required> <label
								class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
						</div>
						<div class="mb-4"></div>
						<button class="btn btn-primary btn-lg btn-block" type="submit">가입 신청</button></div>
					</form>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">가입</button>
				</div> -->
			</div>
		</div>
	</div>

	<main class="form-signin">
		<form action="login.do" method="post">
			<img class="mb-4" src="img/GroupFit_lg_2_rmbg.png" alt="" width="72"
				height="72">
			<h1 class="h3 mb-3 fw-normal">GroupFit</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput" name="id"
					placeholder="name@example.com"> <label for="floatingInput">사번을
					입력하세요.</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					name="pw" placeholder="Password"> <label
					for="floatingPassword">비밀번호를 입력하세요.</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" id="idRemember" name="idRemember">
					Remember me
				</label>
			</div>
			<div class="checkbox mb-3">
				<a href="#" type="button" data-bs-toggle="modal"
					data-bs-target="#joinModal" style="display:none"> 계정이 없으십니까? </a>
			</div>

			<input hidden="1" type="button" value="회원가입" onclick="location.href='join.go'"/>

			<button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2023</p>
		</form>
		<button onclick="location.href='entermem.go'">회원입장</button>
	</main>



</body>
<script type="text/javascript">
	var msg = "${msg}";
	var cookieId = "${rememberedId}";
	if (msg != "") {
		alert(msg);
	}
	
	if (cookieId  != ""){
		$("#floatingInput").val(cookieId);
		$("#idRemember").prop("checked", true);
	}
	
	var pweq = false;
	$('#pw2').on('keyup', function(e){
    	var pw = $('#pw').val();
    	var pw2 = $(this).val();
    	console.log(pw,pw2)
    	
    	if(pw == pw2){
    		$('#pwValidMsg').css({
    			display: 'none'
    		});
    		pweq = true;
    	}else if (pw2 == ""){
    		$('#pwValidMsg').css({
    			display:'none'
    		});
    		pweq = false;
    	} else {
    		$('#pwValidMsg').css({
    			display:'block'
    		});
    		pweq = false;
    	}
    });
  
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
</script>
</html>
