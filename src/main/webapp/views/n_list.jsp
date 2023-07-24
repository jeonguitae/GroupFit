<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>

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
            <h1 class="forcenter">공지사항</h1>
               <div class="forbutton">
                  <button onclick="location.href='nwrite.go'">작성</button>
               </div>
    <table class="table second">
        <colgroup>
            <col width="15%"/>
            <col width="40%"/>
            <col width="15%"/>
            <col width="20%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th  style="text-align: center;">번호</th>
                <th style="text-align: center;">제목</th>
                <th style="text-align: center;">작성자</th>
                <th style="text-align: center;">작성일</th>
                <th style="text-align: center;">조회수</th>
            </tr>
        </thead>        
        <tbody>
            <c:if test="${list eq null}">
                <tr>
                    <th id="forblack" style="text-align:center;" colspan="6">등록된 글이 없습니다.</th>
                </tr>
            </c:if>
            <c:if test="${list.size() == 0}">
               <tr>
               <th colspan="5">조건에 해당하는 게시물이 없습니다.</th>
               </tr>
            </c:if>
            <c:forEach items="${list}" var="bbs">
                <c:if test="${not empty sessionScope.loginId}">
                    <tr>
                        <td style="text-align: center;">${bbs.n_idx}</td>
                        <td style="text-align: center;"><a href="ndetail.do?n_idx=${bbs.n_idx}&flag='detail'" id="detail">${bbs.title}</a></td>
                        <td style="text-align: center;">${bbs.position}</td>
                        <td style="text-align: center;">${bbs.reg_date}</td>
                        <td style="text-align: center;">${bbs.hit}</td>
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