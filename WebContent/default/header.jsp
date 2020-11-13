<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#header{ text-align: center; height: 10%; position: static; }
	.top { font-family:monospace; color:#FF007F; font-size: 3.0em; font-weight: bold; margin: 20px 10px 20px 10px; }
	p{ margin:0; }
	#nav { text-align: right; }
	li {display: inline; margin : 0px 20px; list-style: none;}
</style>
<script>
	function log(){
		if(session.getAttribute("id")!=null){
			session.invalidate();
		}
	}
</script>
</head>
<body>
	<% 
	String login, addr;
	System.out.println("id"+session.getAttribute("id"));
	if(session.getAttribute("id")==null){	login = "로그인"; addr="login.jsp"; }
	else{ login = "로그아웃"; addr="logout.jsp"; }
	%>
<div id="header">
	<p class="top">CARE LAB</p>
	<hr>
	<div id="nav">
	<ul>
		<li><a href="../member/index.jsp">HOME</a></li>
		<li><a href="../member/memberInfo.jsp">회원정보</a></li>
		<li><a href="../member/<%= addr %>" onclick="log()"><%= login %></a></li>
	</ul>
	</div>
	<hr>
</div>
</body>
</html>