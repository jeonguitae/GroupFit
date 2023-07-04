<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 화면 샘플</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

  	<style>
	body {
		min-height: 100vh;
		
		background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
		background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
   	}

    .input-form {
		max-width: 680px;
		
		margin-top: 80px;
		padding: 32px;
		
		background: #fff;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
	</style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">IN & OUT</h4>
        <form class="validation-form" action="join.do" method="post" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" name="name" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">별명</label>
              <input type="text" name="nickname" class="form-control" id="nickname" placeholder="" value="" required>
              <div class="invalid-feedback">
                별명을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" name="email" class="form-control" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="pw">패스워드</label>
            <input type="password" name="pw" class="form-control" id="pw" required>
            <div class="invalid-feedback">
              패스워드를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="pw2">패스워드 확인</label>
            <input type="password" name="pwValid" class="form-control" id="pw2" required>
            <div class="invalid-feedback">패스워드 확인을 입력해주세요.</div>
            <div id="pwValidMsg" style="display: none;color: #dc3545;font-size: 80%;margin-top: 4px;">패스워드가 일치하지 않습니다.</div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <div style="display: flex;">
	            <input type="text" name="address" class="form-control" id="address" placeholder="서울특별시 강남구" required>&nbsp;
	            <button class="btn btn-primary btn-lg btn-block" id="adrButton" type="button" onclick="postCode()" style="width: 100px; font-size: 8pt;">주소 찾기</button>
            </div>
            <div class="invalid-feedback">주소를 입력해주세요.</div>
          </div>

          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;</span></label>
            <input type="text" name="addressDetail" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div>
          
          <div id="editor" contenteditable="true" style="border: 1px black solid">
          		<img alt="" src="resources/img/wani.png" style="width: 400px; height: 400px;">
          </div>

          <!-- <div class="row">
            <div class="col-md-8 mb-3">
              <label for="root">가입 경로</label>
              <select class="custom-select d-block w-100" id="root">
                <option>검색</option>
                <option>카페</option>
                <option>지인 추천</option>
              </select>
              <div class="invalid-feedback">
                가입 경로를 선택해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="code">추천인 코드</label>
              <input type="text" class="form-control" id="code" placeholder="" required>
              <div class="invalid-feedback">
                추천인 코드를 입력해주세요.
              </div>
            </div>
          </div> -->
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 신청</button>
          	<div class="checkbox mb-3">
				<input type="button" value="회원가입" onclick="location.href='join.go'"/>
			</div>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2023 SSS</p>
    </footer>
  </div>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
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
    
    function postCode() {
    	console.log("postCode.");
    	new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색:" "
                document.getElementById("address2").focus();
                
                /* geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                }); */
            }
        }).open();
	}
    
    
  </script>
</body>

</html>