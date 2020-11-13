<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function register(){
		var form = document.getElementById("frm");
		if( document.getElementById("id").value == ""){
			alert("아이디는 필수값입니다")
			document.getElementById("id").focus()
		}else if( document.getElementById("pwd").value == ""){
			alert("비밀번호는 필수값입니다")
			document.getElementById("pwd").focus()
		}else if( document.getElementById("name").value == ""){
			alert("이름은 필수값입니다")
			document.getElementById("name").focus()
		}else{
			form.action = "regChk.jsp"
			form.method = "post"
			form.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="../default/header.jsp" />
<h1>회원가입</h1>
<% response.setCharacterEncoding("utf-8"); %>
<form id="frm">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" id="id"></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pwd" id="pwd"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" id="name"></td></tr>
		<tr><th>주소</th><td><input type="text" name="addr" id="addr"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="tel" id="tel"></td></tr>
		<tr><td><input type="button" onclick="register()" value="회원가입"></td></tr>
	</table>	
</form>
<jsp:include page="../default/footer.jsp" />
</body>
</html>