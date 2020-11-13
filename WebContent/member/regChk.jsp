<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="regInfo" class="member.MemberDTO" />
<jsp:setProperty property="*" name="regInfo"/>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	int result = dao.register(regInfo);
	if(result == 0){%>
		<script type="text/javascript">
			alert("회원가입 실패")
			location.href="register.jsp"
		</script>	
	<%}else{%>
	<script type="text/javascript">
		alert("회원가입 성공")
		location.href="login.jsp"
	</script>	
	<%}%>
</body>
</html>