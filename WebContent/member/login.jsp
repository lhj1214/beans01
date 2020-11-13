<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style>
	#wrap{width:50%; margin: auto; }
</style>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div id="wrap">
	<h1>로그인 페이지 입니다</h1>
<form action="loginChk.jsp">
<table>
	<tr><td><input type="text" placeholder="아이디" name="id"></td>	
		<td rowspan="2"><input type="submit" value="로그인" style="width:50px;height:50px;"></td>
	</tr>
	<tr> <td><input type="text" placeholder="비밀번호" name="pwd"></td> </tr>
	<tr><td><input type="button" onclick="location.href='register.jsp'" value="회원가입"></td></tr>
</table>
</form>	
</div>
<jsp:include page="../default/footer.jsp"/>
</body>
</html>