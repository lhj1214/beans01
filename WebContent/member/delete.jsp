<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	String id = (String)session.getAttribute("id");
	int result = dao.delete(id);
	if(result == 0){%>
		<script type="text/javascript">
			alert("에러발생!!")
			location.href="modify.jsp"
			</script>
		<%}else{
			session.invalidate();%>
			<script type="text/javascript">
			alert("계정이 정상적으로 삭제되었습니다!!")
			location.href="index.jsp"
			</script>
			<%}
%>  
</body>
</html>