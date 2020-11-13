<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user"/>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	int result = dao.update(user);
	if(result == 0){%>
		<script>
			alert("수정 실패!")
			location.href="modify.jsp"
		</script>
		<%}else{
			%>
			<script>
			userinfo = "<%= user.getId()%>"
			console.log(userinfo)
			alert("변경되었습니다")
			location.href="personInfo.jsp?userInfo="+userinfo;
			</script>
		<%}%> 
</body>
</html>