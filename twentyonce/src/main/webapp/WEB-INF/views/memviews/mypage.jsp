<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY ACCOUNT</title>
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/mem_css/front_myPage.css">
<link rel="stylesheet" type="text/css" href="../resources/css/maincss/submenu.css">
<script type="text/javascript">

function checkValue() {
	inputForm=eval("document.pwchangeInfo");
	if(!inputForm.pwnow.value){ //각각 입력창
		alert("현재 비밀번호 입력");
		inputForm.pwnow.focus();
		return false;
	}
	if(!inputForm.pwnew.value){
		alert("새 비밀번호 입력");
		inputForm.pwnew.focus();
		return false;
	}
	if(!inputForm.pwcheck.value){
		alert("비밀번호 확인 입력");
		inputForm.pwcheck.focus();
		return false;
	}
	if(inputForm.pwnew.value!=inputForm.pwcheck.value){
		alert("비밀번호 일치하지 않음");
		inputForm.pwcheck.focus();
		return false;
	} else {
		alert("비번 변경중");
	}
}

function goBack() { //홈 화면으로
	location.href="../";
}

</script>

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
			<a href="./mypage" class="member" ><%=memdto.getId()%> (<%=memdto.getName() %>)</a>&nbsp |&nbsp
			<a href="./logout" class="member" >LOGOUT</a> &nbsp 
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
						<li><a href="../mainviews/video">VIDEO</a></li>
						<li><a href="../wcviews/wcview">DUCKZIL</a>
							<ul>
								<li><a href="../wcviews/wcview">WORLDCUP</a></li>
								<li><a href="../qzviews/qzstartview">QUIZ</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
		
		
<div id="mypage" >
<form action="mypage" method="post" name="pwchangeInfo" onsubmit="return checkValue()" >
<table class="tbl_myPage" border="1">
<tr>
<td>
ㅇ회원 정보
<br>
<br>
아이디 :<%=memdto.getId() %>
<br>
이름 :<%=memdto.getName() %>
<br>
<%
Date time=new Date();
SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

time.setTime(request.getSession().getLastAccessedTime());
%>
Last Login Date <%=formatter.format(time)%>
</td>
<td>
ㅇ상세 정보
<br>
<br>
이메일: <%=memdto.getEmail() %>
<br>
폰번: <%=memdto.getPhone() %>
<br>
주소: <%=memdto.getAddr() %>
</td>
</tr>
<tr></tr>
<tr>
<td>
ㅇ암호 변경
<br>
<br>
현재 비밀번호 <input type="password" name="pwnow" size="10" class="middle">
<br>
<br>
새 비밀번호 <input type="password" name="pwnew" size="10" class="middle">
<br>
<br>
비밀번호 확인 <input type="password" name="pwcheck" size="10" class="middle">
<br>
</td>
<td>
<input type="submit" value="암호 변경" class="middle">
<br>
<br>
<input type="button" value="돌아가기" onclick="goBack()">
</td>
</tr>
<caption><a href="../attviews/attendtable">출석체크</a></caption>
</table>
</form>
</div>

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