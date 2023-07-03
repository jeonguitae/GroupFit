<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="insertMemberRecord" method="POST">
        <label for="exerciseDate">운동일자:</label>
        <input type="date" id="exerciseDate" name="exerciseDate" required>
        
        <label for="memberNumber">회원번호:</label>
        <input type="text" id="memberNumber" name="memberNumber" required>
        
        <label for="memberName">회원이름:</label>
        <input type="text" id="memberName" name="memberName" required>
        
        <label for="weight">몸무게:</label>
        <input type="number" id="weight" name="weight" required>
        
        <button type="submit">등록</button>
    </form>
</body>
</html>