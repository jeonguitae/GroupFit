<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 변경 요청 리스트</title>

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
      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-6">

               </div>
               <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                     <li class="breadcrumb-item"><a href="#">메인</a></li>
                     <li class="breadcrumb-item active">뎁스1</li>
                     <li class="breadcrumb-item active">뎁스2</li>
                  </ol>
               </div>
            </div>
         </div>
         <!-- /.container-fluid -->
      </section>
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
            <h1 class="forcenter">출퇴근 변경 요청 리스트</h1>
               <div class="togo">
                  <button onclick="location.href='confirmlist.do'">출퇴근 변경 처리 내역</button>
               </div> 
    <table class="table second">
        <colgroup>
            <col width="25%"/>
            <col width="35%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th style="text-align: center;">요청일</th>
                <th style="text-align: center;">제목</th>
                <th style="text-align: center;">이름</th>
                <th style="text-align: center;">직위</th>
                <th style="text-align: center;">수정 요청 사항</th>
                <th style="text-align: center;">상태</th>
            </tr>
        </thead>        
        <tbody>
            <c:if test="${working eq null}">
                <tr>
                    <th id="forblack" style="text-align:center;" colspan="6">근태내역이 없습니다.</th>
                </tr>
            </c:if>
            <c:if test="${working.size() == 0}">
               <tr>
               <th colspan="6">요청내역이 없습니다.</th>
               </tr>
            </c:if>
            <c:forEach items="${working}" var="dto">
                <c:if test="${not empty sessionScope.loginId}">
                    <tr>
                        <td style="text-align: center;">${dto.reg_date}</td> 
                        <td style="text-align: center;"><a href="rdetail.do?r_idx=${dto.r_idx}" id="detail">${dto.title}</a></td>         
                        <td style="text-align: center;">${dto.name}</td>
                        <td style="text-align: center;">${dto.position}</td>      
                        <td style="text-align: center;">${dto.com_category}</td>                                        
                        <td style="text-align: center;">${dto.status}</td>
                    </tr>
                </c:if>         
            </c:forEach>
        </tbody>
       </table>
         </div>
         <!--/. container-fluid -->
      </section>
   </div>
</body>
</html>