<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>userBean.jsp<br>
	<%--
		MemberDTO dto = new MemberDTO();
	--%>
	<jsp:useBean id="dto" class="members.MemberDTO" />
	<%-- id는 객체명, class는 위치 위의 new를 사용해서 하는 것과 동일 --%>
	<h3>저장 전 출력</h3>
	<%=dto.getId() %> : <%=dto.getPwd() %>
	
	<% dto.setId("test"); dto.setPwd("1234"); %>
	<h3>저장 후 출력</h3>
	<%=dto.getId() %> : <%=dto.getPwd() %>
</body>
</html>