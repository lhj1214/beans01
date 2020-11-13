<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
<script>
function sendInfo(){
	var form = document.getElementById("frm");
	form.action = "personInfo.jsp"
	form.method = "post"
	form.submit();
}
</script>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	if(session.getAttribute("id") == null){response.sendRedirect("login.jsp");}
	ArrayList<MemberDTO> list = dao.memberList();
	System.out.println("arr"+list.size());
%>
<h1>회원목록</h1>
<form id="frm">
	<table border="1px solid black">
		<tr><th>이름</th><th>주소</th><th>전화번호</th></tr>
		<%
		for(MemberDTO dto : list){%>
			<tr>
			<td><a href="personInfo.jsp?userInfo=<%=dto.getId() %>"><%=dto.getName()%></a></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getTel()%></td>
			</tr>
		<%}%>
	</table>
</form>
<jsp:include page="../default/footer.jsp"/>
</body>
</html>