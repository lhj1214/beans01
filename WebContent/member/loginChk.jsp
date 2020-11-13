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
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
	String id = dto.getId(); 
	String pwd = dto.getPwd(); 
	int result = dao.loginChk(id, pwd);
	System.out.println(result);
	System.out.println(id);
	System.out.println(pwd);
	if(result == 1){%>
		<script type="text/javascript">
		alert("등록되지 않은 아이디입니다")
		location.href="login.jsp"
		</script>
	<%}else if(result == 0 ){
		session.setAttribute("id", id);
		response.sendRedirect("successLogin.jsp");
		}else{%>
			<script>
			alert("아이디와 비밀번호를 확인하시기 바랍니다")
			location.href="login.jsp"
			</script>
		<%}%>
	
</body>
</html>