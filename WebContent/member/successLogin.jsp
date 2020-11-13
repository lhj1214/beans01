<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>successLogin</title>
</head>
<body>
<% if(session.getAttribute("id") == null){response.sendRedirect("login.jsp");}%>
<jsp:include page="../default/header.jsp" />
<h1>로그인 성공</h1>
<jsp:include page="../default/footer.jsp" />
</body>
</html>