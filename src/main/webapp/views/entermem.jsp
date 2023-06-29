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

.hidden {
	display:none;
}
</style>

</head>
<body class="text-center">
	<main class="form-signin">
		
		<img class="mb-4" src="img/GroupFit_lg_2_rmbg.png" alt="" width="72"
				height="72">
		<h1 class="h3 mb-3 fw-normal">GroupFit</h1>
		
		<select name="mem_no" class="mem_no hidden">
			
		</select>	
		
		<input type="text" name="entermem_no" value="" placeholder="전화번호 뒷자리를 입력해주세요."/>
		<button class="enter" onclick="entermem()">입장</button>
	</main>
	
</body>
<script>
	var $entermem_no = '';
	
	var $name = '';
	
	function entermem(){
		$entermem_no = $('input[name="entermem_no"]').val();
		$name = $('select[name="mem_no"]').val();
		$.ajax({
			type:'post',
			url:'entermem.ajax',
			data:{
				'entermem_no' : $entermem_no
			},
			dataType:'json',
			success:function(data){
				console.log(data.row);
				
				if(data.row == 1){
					$.ajax({
						type:'get',
						url:'entry_mem.ajax',
						data:{'mem_no' : data.mem_no
							  ,'b_idx' : data.b_idx		
						},
						dataType:'json',
						success:function(data){
							alert(data.msg);
						},
						error:function(e){
							console.log(e);
						}
					});	
				}
				
				else if(data.row == 0){
					alert('등록되지 않은 회원입니다.');
				}
				
				else if(data.row > 1){
				
					optionDraw(data.list);
					$('button[class="enter"]').attr('onclick', 're_entermem()');
				}
			},
			error:function(e){
				console.log(e);
				alert('등록되지 않은 회원입니다.');
			}
		});	
	}
	
	function optionDraw(memlist){
		//console.log(list);
		var content = '';
		
		memlist.forEach(function(item,index){
			
			content += '<option value="' + item.name + '">'+item.name+'</option>';
		});
		
		//$('select[name="mem_no"]').attr('hidden', 'false');
		$('select[name="mem_no"]').removeClass('hidden');
		
		$('select[name="mem_no"]').empty();
		$('select[name="mem_no"]').append(content);
	}
	
	function re_entermem(){
		$entermem_no = $('input[name="entermem_no"]').val();
		$name = $('select[name="mem_no"]').val();
		$.ajax({
			type:'get',
			url:'dup_entermem.ajax',
			data:{'entermem_no' : $entermem_no,
				  'name' : $name
			},
			dataType:'json',
			success:function(data){
				alert(data.msg);
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
</script>
</html>
