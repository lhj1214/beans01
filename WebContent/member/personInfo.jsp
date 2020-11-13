<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../default/header.jsp" />
<jsp:useBean id="user" class="member.MemberDAO" />
<%
	response.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userInfo");
	System.out.println("userId"+userId);
	MemberDTO userInfo = user.userInfo(userId);
%>
<h1>개인 정보</h1>
<table>
	<tr>	<th>아 이 디</th><td><%= userInfo.getId() %></td></tr>
	<tr>	<th>비밀번호</th><td><%= userInfo.getPwd() %></td>	</tr>
	<tr>	<th>이 름</th><td><%= userInfo.getName() %></td>	</tr>
	<tr>	<th>주 소</th><td><%= userInfo.getAddr() %></td>	</tr>
	<tr>	<th>전화번호</th><td><%= userInfo.getTel() %></td>	</tr>
<% if(userId.equals(session.getAttribute("id"))){%>
	<tr>	<td><button onclick="location.href='modify.jsp'">수정</button></td>
	<td><button onclick="location.href='delete.jsp'">삭제</button></td></tr>
<%}%>	
	
</table> 
<jsp:include page="../default/footer.jsp" />
</body>
</html>