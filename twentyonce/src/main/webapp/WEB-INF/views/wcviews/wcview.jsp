<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="twentyOnce.wc.dto.NomineeDto"%>
<%@page import="twentyOnce.wc.dto.WorldcupProgress"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
    
<%

//진행 사항

WorldcupProgress wcprogress=(WorldcupProgress)request.getAttribute("wcprogress");
int thisRound=wcprogress.getThisRound();
int nextMatch=wcprogress.getNextMatch();

//대전 상대

ArrayList<NomineeDto> matchlist=(ArrayList)request.getAttribute("matchlist");

NomineeDto nom0=matchlist.get(0);
NomineeDto nom1=matchlist.get(1);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<!-- <link type="text/css" rel="stylesheet" href="../resources/css/maincss/menubar.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

#wcpage {
	margin: 50px;
}

#pics {
	margin: 25px;
}

#pic0, #pic1 {
	float: left;
	width: 50%;
}

</style>

</head>
<body>
<div id="header">
			<div class="container">
			           <div class="top_info">
 	<%
		MemberDto memdto = (MemberDto) request.getSession().getAttribute("memdto");
		boolean login = memdto == null ? false : true;

		if (login) {
			if (memdto.isAdmin()) {
	%>
	<c:out value="당신은 ADMIN입니다." />
	<%
		} else if (!memdto.isAdmin()) {
	%><c:out value="당신은 ONCE입니다." />
	<%
		}
   }
	%>
	</div>
		<!--       로그인,회원가입-->
		<div class="top_info">
			<a href="../memviews/mypage" class="member" ><%=memdto.getId()%></a>&nbsp |&nbsp
			<a href="../memviews/logout" class="member" >LOGOUT</a> &nbsp 
			<%
			if (memdto.isAdmin()) {
				%>
			<a href="../visviews/visstatsview" class="member" >[ADMIN PAGE]</a>
			<%
			}
			%>
		</div>
				<div id="logo">
					<h1>
						<a href="../">twentyOnce</a>
					</h1>
				</div>
				<nav id="nav">
					<ul>
						<li class="active"><a href="../frontAfterviews/twfrontAfter">MAIN</a></li>
						<li><a href="../brdviews/not_Notice/list">NOTICE</a></li>
						<li><a href="../stoviews/list">STORE</a></li>
						<li><a href="../schviews/schedule">SCHEDULE</a></li>
						<li><a href="../stoviews/list">VIDEO</a></li>
						<li><a href="../wcviews/wcview">DUCKZIL</a></li>
					</ul>
				</nav>
			</div>
		</div>



<form name="nom0form" action="wcview" method="POST">
<input type="hidden" name="thisround" value="<%=thisRound %>" />
<input type="hidden" name="nextmatch" value="<%=nextMatch+2 %>" />
<input type="hidden" name="lastwinner" value="<%=nom0.getWc_code() %>" />
<input type="hidden" name="lastloser" value="<%=nom1.getWc_code() %>" />
</form>

<form name="nom1form" action="wcview" method="POST">
<input type="hidden" name="thisround" value="<%=thisRound %>" />
<input type="hidden" name="nextmatch" value="<%=nextMatch+2 %>" />
<input type="hidden" name="lastwinner" value="<%=nom1.getWc_code() %>" />
<input type="hidden" name="lastloser" value="<%=nom0.getWc_code() %>" />
</form>

<div id="wcpage">

<%
if(thisRound>2) {
%>
<h3>월드컵 <%=thisRound %>강</h3>
<%
} else {
%>
<h3>월드컵  결승전</h3>
<%
}
%>

<div id="pics">
<div id="pic0">

<%=nom0.getWc_title() %><br>
<%-- <a href="wcview?thisround=<%=thisRound %>&nextmatch=<%=nextMatch+2 %>&lastwinner=<%=nom0.getwCode() %>&lastloser=<%=nom1.getwCode() %>">
<img alt="" src="<%=nom0.getwMemory() %>">
</a><br> --%>
<a href="#" onclick="javascript:document.nom0form.submit();">
<img alt="" src="<%=nom0.getWc_memory() %>">
</a>

</div>

<br>
<br>

<div id="pic1">

<%=nom1.getWc_title() %><br>
<%-- <a href="wcview?thisround=<%=thisRound %>&nextmatch=<%=nextMatch+2 %>&lastwinner=<%=nom1.getwCode() %>&lastloser=<%=nom0.getwCode() %>">
<img alt="" src="<%=nom1.getwMemory() %>">
</a><br> --%>
<a href="#" onclick="javascript:document.nom1form.submit();">
<img alt="" src="<%=nom1.getWc_memory() %>">
</a>

</div>
</div>
</div>

<br>
<!-- 소셜 -->
             <div id="footer">
                <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="../resources/images/mainimg/facebook.PNG" alt="facebook"></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="../resources/images/mainimg/instargram.PNG" alt="instargram"></a>
                <a href="https://twitter.com/JYPETWICE"><img src="../resources/images/mainimg/twitter.PNG" alt="twitter"></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="../resources/images/mainimg/youtube.PNG"></a>
                <a href="https://fans.jype.com/Portal"><img src="../resources/images/mainimg/fans.PNG" alt="fans"></a>
                </div>
               </div>
</body>
</html>