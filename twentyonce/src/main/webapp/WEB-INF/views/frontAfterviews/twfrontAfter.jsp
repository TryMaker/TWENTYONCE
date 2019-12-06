<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page session="false"%>

<%

MemberDto memdto = (MemberDto) request.getSession().getAttribute("memdto");
boolean login = memdto == null ? false : true;

if (login) {

%>

<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="../resources/slick/slick-theme.css">
<link rel="stylesheet" type="text/css" href="../resources/css/maincss/submenu.css">
 <script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>
   
<script type="text/javascript" src="../resources/slick/slick.min.js"></script>  
   <script type="text/javascript">
   
   $(document).ready(function(){
	   $('.autoplay').slick({
		   infinite:true,
		   slidesToShow: 1, //보여질 이미지 개수
		   slidesToScroll: 1, //스크롤시 이동할 이미지 개수
		   autoplay: true, //자동으로 다음 이미지
		   autoplaySpeed: 2000, //다음 이미지로 넘어갈 시간
		   speed:1000 , /* 다음이미지로 넘겨질때 걸리는 시간 */
		   pauseOnHover:true, /* 마우스 호버시 슬라이드 이동 멈춤 */
// 		   responsive: [ 
// 			   { /* 반응형웹*/ breakpoint: 960, /* 기준화면사이즈 */ settings: {slidesToShow:2 } /* 사이즈에 적용될 설정 */ }, 
// 			   { /* 반응형웹*/ breakpoint: 768, /* 기준화면사이즈 */ settings: {slidesToShow:1 } /* 사이즈에 적용될 설정 */ } ]
		 });
   });
   </script>

</head>
<style>
/* 화살표 */
.slick-arrow { 
 z-index: 2; /* prev버튼은 위치 이동시 이미지 뒤로 숨겨짐 */ 
 position:absolute; /* 원하는 위치에 지정 */ 
 top: 50%; 
 width: 50px; 
 height: 50px; 
 transform: translateY(-25px);,
 } 
 
 .slick-prev.slick-arrow{ /* prev 이전 */ left: 0; } 
 .slick-next.slick-arrow{ /* next 다음 */ right: 0; } 
 /* 아래점 */ 
 .slick-dots{ text-align: center; } 
 .slick-dots li{ display: inline-block; margin: 0 5px; }

.slick-prev::before {
  color: #000;
  font-size: 40px; 
}
.slick-next::before {
   color: #000;
  font-size: 40px; 
}


</style>

<body>
<!-- 메뉴 -->
		<div id="header">
			<div class="container">
              <div class="top_info">
 	<%
			if (memdto.isAdmin()) {
	%>
	<c:out value="당신은 ADMIN입니다." />
	<%
		} else if (!memdto.isAdmin()) {
	%><c:out value="당신은 ONCE입니다." />
	<%
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
						<li class="active"><a href="./twfrontAfter">MAIN</a></li>
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
<!-- 슬라이더 -->
<div class="autoplay" align="center" style="width: auto; margin: auto;">
    <div><img src="../resources/images/front_img/chrisjihyo1.jpg"/></div>
    <div><img src="../resources/images/front_img/chrisnayeon1.jpg"/></div>
    <div><img src="../resources/images/front_img/chrissana1.jpg"/></div>
    <div><img src="../resources/images/front_img/chrisccha1.jpg"/></div>
    <div><img src="../resources/images/front_img/chrismina1.jpg"/></div>
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
<%
} else {
%>

<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>

<%
}
%>

</body>
</html>
