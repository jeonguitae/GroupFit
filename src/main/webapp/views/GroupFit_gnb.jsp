<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.item-sub{
		font-size: 14px;
	}
	
	.header-sub{
	    padding-top: 0px;
	    padding-bottom: 0px;
	    padding-left: 16px;						
	}
</style>
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
<body
	class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">GroupFit</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="display:flex;align-items: center">
				<img src="img/GroupFit_lg_2.png" alt="GroupFit Logo"
						class="brand-image elevation-3"
						style="background-color: transparent; transform: scale(0.8); opacity: 1">
					<div>
						<span>&nbsp;GroupFit v0.01</span><br>
						<span>&nbsp;Created by <a
						target="_blank" href="https://github.com/Mochacina">SSS</a></span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="wrapper">

		<nav class="main-header navbar navbar-expand navbar-dark">

			<!-- 왼쪽 navbar 항목 -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link"> 
						<c:choose>
						<c:when test="${empty sessionScope.loginEmp.new_photo_name}">
							<img src="img/wani.png"
						style="width: 2.1rem; top: -5px; right: 5px; position: relative; vertical-align: top;"
						class="brand-image img-circle elevation-2" alt="User Image">
						</c:when>
						<c:otherwise>
							<img src="photo/${sessionScope.loginEmp.new_photo_name}"
						style="width: 2.1rem; top: -5px; right: 5px; position: relative; vertical-align: top;"
						class="brand-image img-circle elevation-2" alt="User Image">
						</c:otherwise>
					</c:choose>
						<span style="font-weight: 800; color: #FFFFFF; display: inline">${sessionScope.loginEmp.name}</span>
						님, 환영합니다!
				</a></li>
				<li><div style="margin-right: 15px;height:100%;display:flex;align-items: center">
					<span></span>
				</div></li>
				<li>
					<button type="button" class="btn btn-dark" onclick="location.href='come.do'">출근</button>
				</li>
				<li>
					<button type="button" class="btn btn-dark" onclick="location.href='out.do'">퇴근</button>
				</li>
				<!-- <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li> -->
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"
					style="display: none"> <i class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link" href="postGetList.go"> <i
						class="far fa-regular fa-envelope"></i>
						<span id="unreadMailCount" style="visibility:hidden" class="badge badge-danger navbar-badge"></span>
				</a></li>
				<!-- Notifications Dropdown Menu -->
				<!-- <li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">2</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">2개의 새 알림이 있습니다.</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> <span
							class="float-right text-muted text-sm">3 mins</span>
							<p class="text-sm">정의태 님의 메일 도착: "테스트 메일 …</p>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							<span class="float-right text-muted text-sm">5 mins</span>
							<p class="text-sm">결재 완료: "휴가 요청: 06-13 ~ 06-15 …</p>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">모든 알림 보기</a>
					</div></li> -->
				<!-- <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li> -->
				<li class="nav-item"><a  class="nav-link" href="logout.do"
					role="button"> <i class="fas fa-sign-out-alt"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a type="button" class="brand-link" href="/main"> <img
				src="img/GroupFit_lg_2.png" alt="GroupFit Logo"
				class="brand-image img-circle elevation-3"
				style="background-color: transparent; transform: scale(1.1); opacity: .8"> <!-- data-bs-toggle="modal" data-bs-target="#exampleModal" -->
				<span class="brand-text font-weight-light">GroupFit</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-header"  style="text-align: center;margin: 0 auto">
							<button class="btn btn-outline-info" style="margin: 0 auto" onclick="location.href='/approvalEventRequest.go'">결재 문서 작성
							</button></li>
						<li class="nav-header">GroupFit Works</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-book"></i>
								<p>
									회원 관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item item-sub"><a href="memlist.go" class="nav-link"> <i
										class="fas fa-user nav-icon"></i>
										<p>전체 회원</p>
								</a></li>
								<c:if test="${sessionScope.loginEmp.position == '트레이너'}">
									<li class="nav-item item-sub"><a href="ptmemlist.go" class="nav-link"> <i
											class="fas fa-running nav-icon"></i>
											<p>PT 회원</p>
									</a></li>
									<li class="nav-item item-sub"><a href="dailyptt" class="nav-link"> <i
											class="fas fa-edit nav-icon"></i>
											<p>PT 회원일지</p>
									</a></li>
								</c:if>
								<li class="nav-item item-sub"><a href="entermemlist.go" class="nav-link"> <i
										class="fas fa-edit nav-icon"></i>
										<p>입장한 회원 리스트</p>
								</a></li>
								<li class="nav-item item-sub"><a href="memberStatis" class="nav-link"> <i
										class="fas fa-edit nav-icon"></i>
										<p>회원 통계</p>
								</a></li>
							</ul></li>
						<c:if test="${sessionScope.loginEmp.position == '대표'}">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="nav-icon fas fa-users"></i>
								<p>
									직원 관리 <i class="fas fa-angle-left right"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item item-sub">
									<a href="empList.go" class="nav-link"> 
										<i class="fas fa-user nav-icon"></i>
										<p>직원 리스트</p>
									</a>
								</li>
								<c:if test="${sessionScope.loginEmp.position == '대표'}">
								<li class="nav-item item-sub">
									<a href="empRetire.go" class="nav-link">
										<i class="fas fa-running nav-icon"></i>
										<p>퇴사 직원 리스트</p>
									</a>
								</li>
								</c:if>
							</ul>
						</li>
						</c:if>
						<li class="nav-item"><a href="calendar" class="nav-link"> <i
								class="nav-icon fas fa-calendar-alt"></i>
								<p>
									일정 관리 <span class="badge badge-info right"></span>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-dumbbell"></i>
								<p>
									시설 관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item item-sub"><a href="maclist.go" class="nav-link"> <i
										class="nav-icon fas fa-dumbbell"></i>
										<p>머신 관리</p>
								</a></li>
								<li class="nav-item item-sub"><a href="fixedmac.go" class="nav-link"> <i
										class="nav-icon fas fa-tools"></i>
										<p>수리신청 된 머신</p>
								</a></li>
								<li class="nav-item item-sub"><a href="loclist.go" class="nav-link"> <i
										class="nav-icon fas fa-door-closed"></i>
										<p>라커 관리</p>			
								</a></li>
						</ul></li>
						<li class="nav-item"><a href="ticket.go" class="nav-link"> <i
								class="nav-icon fas fa-ticket-alt"></i>
								<p>
									이용권 관리 <span class="badge badge-info right"></span>
								</p>
						</a></li>
						<li class="nav-header">Group Works</li>
						<li class="nav-item"><a href="nlist.go" class="nav-link"> <i
								class="nav-icon fas fa-bell"></i>
								<p>공지사항</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-mail-bulk"></i>
								<p>
									이메일 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item item-sub"><a href="postSendList.go" class="nav-link"> <i
										class="fas fa-envelope nav-icon"></i>
										<p>보낸 쪽지함</p>
								</a></li>
								<li class="nav-item item-sub"><a href="postGetList.go" class="nav-link"> <i
										class="fas fa-envelope-open nav-icon"></i>
										<p>받은 쪽지함</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-copy"></i>
								<p>
									결재 관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							
							<ul class="nav nav-treeview">
								<c:if test="${sessionScope.loginEmp.position == '지점장' || sessionScope.loginEmp.position == '대표'}">
								<li class="nav-header" style="padding-top: 2px;padding-bottom: 2px;padding-left: 16px">결재하기</li>
								<li class="nav-item"><a href="approvalStayList.do" class="nav-link"> <i
										class="fas fa-file nav-icon"></i>
										<p>결재 대기 문서</p>
								</a></li>
								<li class="nav-item"><a href="approvalExpectedList.do" class="nav-link"> <i
										class="fas fa-file-signature nav-icon"></i>
										<p>결재 예정 문서</p>
								</a></li>
								</c:if>
								<li class="nav-header" style="padding-top: 2px;padding-bottom: 2px;padding-left: 16px">개인 문서함</li>
								<li class="nav-item"><a href="approvalAllList.do" class="nav-link"> <i
										class="fas fa-file nav-icon"></i>
										<p>결재 문서함</p>
								</a></li>
								<li class="nav-item"><a href="approvalSaveList.do" class="nav-link"> <i
										class="fas fa-file-signature nav-icon"></i>
										<p>임시 문서함</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-chart-pie"></i>
								<p>
									통계 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item item-sub"><a href="individualChart"
									class="nav-link"> <i class="fas fa-chart-line nav-icon"></i>
										<p>개인 매출통계</p>
								</a></li>
								<c:if test="${sessionScope.loginEmp.position == '지점장'}">
								<li class="nav-item item-sub"><a href="branchChart"
									class="nav-link"> <i class="fas fa-sitemap nav-icon"></i>
										<p>지점 매출통계</p>
								</a></li>
								</c:if>
								<c:if test="${sessionScope.loginEmp.position == '대표'}">
								<li class="nav-item item-sub"><a href="chart"
									class="nav-link"> <i
										class="fas fa-project-diagram nav-icon"></i>
										<p>전체 매출통계</p>
								</a></li>
								</c:if>
							</ul></li>
						<li class="nav-item"><a href="referenceList.do" class="nav-link"> <i
								class="nav-icon fas fa-columns"></i>
								<p>자료실</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-user-check"></i>
								<p>
									근태 관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item item-sub"><a href="/wlist.do"
									class="nav-link"> <i class="fas fa-user-check nav-icon"></i>
										<p>나의 근태관리</p>
								</a></li>
								<c:if test="${sessionScope.loginEmp.position == '지점장' || sessionScope.loginEmp.position == '대표'}">
								<li class="nav-item item-sub"><a href="/centerlist.do"
									class="nav-link"> <i class="fas fa-check-double nav-icon"></i>
										<p>지점 근태관리</p>
								</a></li>
								</c:if>
							</ul></li>
						<c:if test="${sessionScope.loginEmp.position == '지점장' || sessionScope.loginEmp.position == '대표'}">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-calendar-check"></i>
								<p>
									휴가 관리 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<!-- <li class="nav-item item-sub"><a href="#"
									class="nav-link"> <i class="far fa-calendar-check nav-icon"></i>
										<p>휴가 신청</p>
								</a></li> -->
								
								<li class="nav-item item-sub"><a href="annualList.go" class="nav-link"> <i
										class="nav-icon far fa-calendar-check"></i>
										<p>직원 연차관리</p>
								</a></li>
								
							</ul></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</aside>

	</div>
	<!-- Bootstrap -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>

	<!-- PAGE PLUGINS -->
	<!-- jQuery Mapael -->
	<script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
	<script src="plugins/raphael/raphael.min.js"></script>
	<script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
	<script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
	<!-- ChartJS -->
	<script src="plugins/chart.js/Chart.min.js"></script>

	<!-- AdminLTE for demo purposes -->
	<!-- <script src="dist/js/demo.js"></script> -->
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- <script src="dist/js/pages/dashboard2.js"></script> -->
</body>
<script>
	mailCount();
	console.log(${sessionScope.loginEmp.emp_no});

	function mailCount(){
		$.ajax({
			type : 'get',
			url : 'unreadMailCount.ajax',
			data : {
				'emp_no' : ${sessionScope.loginEmp.emp_no}
			},
			dataType : 'json',
			success : function(data) {
				console.log("안 읽은 메일 수: " + data.mailcount);
				if (data.success) {
					if(data.mailcount >= 1){
						console.log("안 읽은 메일이 있습니다.")
						$("#unreadMailCount").css("visibility", "visible");
						$("#unreadMailCount").html(data.mailcount);
					}
				}
			},
			error : function(e) {
				console.log("메일 카운트를 받아오는데 실패했습니다.");
			}
		});
	}

	var msg = "${msg}";
	 
	if(msg != ""){
		alert(msg);
	}
	if("${sessionScope.loginId}" == ""){
		alert("로그인이 필요한 기능입니다.");
		location.href="/";
	}
	console.log("${sessionScope.loginEmp.name}");
	console.log("${sessionScope.loginEmp.b_name}");
</script>