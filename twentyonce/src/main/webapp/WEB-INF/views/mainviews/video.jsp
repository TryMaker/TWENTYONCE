<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="twentyOnce.mem.dto.MemberDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>video</title>
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/maincss/submenu.css">
  <link rel="stylesheet" href="../resources/css/maincss/vidhp.css">
</head>
<body>
   <div id="main">
        <img src="../resources/images/mainimg/videoimg/concert.png" class="concert">
                </div>
<!--         <div id="lg"><a href="../memviews/loginform" class="login">로그인</a> | <a href="../memviews/joinform" class="member">회원가입</a></div> -->
       <!-- 메뉴 -->
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
                  <li><a href="./video">VIDEO</a></li>
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
        <div id="list-nav">
            <iframe width="1000" height="550" src="https://www.youtube.com/embed/3ymwOvzhwHs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
            </iframe>
            <a href="video2.html"><img src="../resources/images/mainimg/videoimg/video2.PNG" class="img1"></a>
            <a href="video3.html"> <img src="../resources/images/mainimg/videoimg/video3.PNG" class="img2"></a>
            <a href="video4.html"> <img src="../resources/images/mainimg/videoimg/video4.PNG" class="img3"></a>
            <a href="video5.html"><img src="../resources/images/mainimg/videoimg/video5.PNG" class="img4"></a>
        </div>
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