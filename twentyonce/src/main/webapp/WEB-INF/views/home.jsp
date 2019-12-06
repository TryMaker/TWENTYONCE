<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>

<% 	
	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto == null?false:true;
%>
<html>
<head>
<title>Home</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link type="text/css" rel="stylesheet"
	href="resources/css/home_css/entranceView.css">
<script type="text/javascript">
	//Just for restart animation on resize or click.
	document.onclick = window.onresize = function() {
		var elm = document.querySelector("#black");
		var newone = elm.cloneNode(true);
		elm.parentNode.replaceChild(newone, elm);
	}

	function loginProcess() {
		alert("NEXT PAGE.");
		
		if(<%=login%> == false){ //로그인 값 없으면 로그인폼으로
		window.location.href = "/twentyOnce/memviews/loginform";
		}
		else if(<%=login%> == true){//로그인 값 존재 바로 메인페이지로
		window.location.href = "/twentyOnce/frontAfterviews/twfrontAfter";
		}
	}
</script>

</head>
<body>
	<div id="black"></div>
	<div id="text" onclick="javascript:loginProcess()" style="cursor: pointer;">
		LOVE<br><span style="color: #000;">& TWICE<span></div>
</body>
</html>
