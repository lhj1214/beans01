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
	String userId = (String)session.getAttribute("id");
	MemberDTO userInfo = user.userInfo(userId);
%>
<h1>개인 정보 수정</h1>
<form action="modifyChk.jsp">
<table>
	<tr>	<th>아 이 디</th><td><input type=text name="id" value="<%= userInfo.getId() %>" readOnly></td><td>수정불가</td></tr>
	<tr>	<th>비밀번호</th><td><input type=text name="pwd" value="<%= userInfo.getPwd() %>"></td>	</tr>
	<tr>	<th>이 름</th><td><input type=text name="name" value="<%= userInfo.getName() %>"></td>	</tr>
	<tr>	<th>주 소</th><td><input type=text name="addr" value="<%= userInfo.getAddr() %>"></td>	</tr>
	<tr>	<th>전화번호</th><td><input type=text name="tel" value="<%= userInfo.getTel() %>"></td>	</tr>
	<tr>	<td><input type="submit" value="수정"></td>
			<td><input type="button" onclick="javacript:history.back()" value="취소"></td>	</tr>
</table>
</form> 
<jsp:include page="../default/footer.jsp" />
</body>
</html>