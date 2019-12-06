<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 페이지</title>
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/store.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/sto_menu.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/skel-noscript.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/store_style.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/style-desktop.css" />
   <link rel="stylesheet" type="text/css" href="../resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="../resources/slick/slick-theme.css">
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
</head>
<body>
<% 
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
boolean login=memdto==null?false:true;

System.out.println("시작하는 순서는?");

if(login) {
%>
<%
	if(memdto.isAdmin()) {
%>
	<!-- 관리자일 때 -->
 		<div id="header">
			<div class="container">

				<!-- 로고 -->
				<div id="logo">
					<h1><a href="../">twentyOnce</a></h1>
				</div>

				<!-- Nev -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="list">PRODUCTION</a></li>
						<li><a href="#">SALE</a></li>
						<li><a href="cartList?userId=<%=memdto.getId() %>">SHOPPING CART</a></li>
						<li><a href="orderList?userId=<%=memdto.getId()%>">ORDER LIST</a></li>
						<li><a href="twocolumn2.html">EVENT</a></li>
						<li><a href="onecolumn.html">COMMUNITY</a></li>
					</ul>
				</nav>
			</div>
		</div>
	
		<!-- 인기 상품 태그 -->
		<div id="marketing">
			<div class="container">
				<div class="row">
					<div class="3u">
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div class="container">
				<div class="row">
					<div class="8u">
					</div>
					<div class="4u">
					</div>
				</div>
			</div>
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
      	
      	
      <%
      /* 유저일 때  */
		} else{
		%>
		<div id="header">
			<div class="container">

				<!-- 로고 -->
				<div id="logo">
					<h1><a href="../">twentyOnce</a></h1>
				</div>

				<!-- Nev -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="list">PRODUCTION</a></li>
						<li><a href="#">SALE</a></li>
						<li><a href="cartList?userId=<%=memdto.getId() %>">SHOPPING CART</a></li>
						<li><a href="orderList?userId=<%=memdto.getId()%>">ORDER LIST</a></li>
						<li><a href="twocolumn2.html">EVENT</a></li>
						<li><a href="onecolumn.html">COMMUNITY</a></li>
					</ul>
				</nav>

			</div>
		</div>
	
		<!-- 슬라이더 -->
		<div class="autoplay" align="center" style="width: 1902px; height: 600px">
		    <div><img src="../resources/images/front_img/chrisjihyo1.jpg"/></div>
		    <div><img src="../resources/images/front_img/chrisnayeon1.jpg"/></div>
		    <div><img src="../resources/images/front_img/chrissana1.jpg"/></div>
		    <div><img src="../resources/images/front_img/chrismina1.jpg"/></div>
		</div>
		
		<div id="featured">
			<div class="container">
			
				<span class='green_window'>
						<input type='text' class='input_text' placeholder="검색어를 입력하세요." />
				</span>
						<button type='submit' class='sch_smit'>검색</button>
				<br/><br/><br/>
				<div class="row">
					<!-- 상품 목록 출력 -->
					<c:forEach items="${list }" var="dto">
						<div class="3u">
							<section>
								<div class="sample_image">
									<a href="content_view?sto_code=${dto.sto_code }" class="image full"><img src="../resources/images/stoimg/${dto.sto_imageurl }" alt="" style="width: 282px; height: 243px;" ></a>
								</div>
								<header>
									<h2>${dto.sto_name }</h2>
								</header>
								<p><fmt:formatNumber pattern="###,###,###" value="${dto.sto_price }" />원</p>				
							</section>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 인기 상품 태그 -->
		<div id="marketing">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section id="my_first">
							<header>
								<h2>Twice INFORMATION</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="../resources/images/storeimg/chrismass_1.jpg" width="260" height="260" alt="">
									<p>춤으로 유명한 JYP 소속 아티스트답게 평균 춤 실력 자체는 상당히 준수하다. 멤버들 중 쯔위와 정연을 제외하면[24] 키는 160 내외로 대체로 비슷해서 안무대형을 설 때나 군무를 출 때 보기가 좋고, 비율이 좋아 춤이 시원시원해 보이고 춤선이 예뻐 보이는 게 장점이다. </p>
								</li>
								
								<li><img src="../resources/images/storeimg/chrismass_2.jpg" width="260" height="260" alt="">
									<p>안무는 대부분 복잡하거나 격한 동작이 적고, 노래 가사를 반영한 따라하기 쉬운 포인트 동작, 귀여운 킬링 파트와 멤버 간 협동을 강조한 군무가 많다. 곡들마다 독특한 대형과 구성[25]을 가지고 차별화된 느낌을 주며, 가사를 그대로 동작으로 표현하되 곡의 느낌과 스타일에 맞는 포인트 동작을 많이 배치해 기억 속에 쉽게 남고, 곡이 쉽게 각인되도록 하는 게 트와이스의 전략이자 인기요인 중 하나다.</p>
								</li>
								<li><img src="../resources/images/storeimg/chrismass_3.jpg" width="260" height="260" alt="">
									<p>TWICE의 가장 큰 장점으로는 9명 모두 예쁘다는 평을 들으며, 평균 비주얼이 높다는 것이다. 그래서 붙여진 별명이 ‘예쁜 애 옆에 예쁜 애 옆에 예쁜 애가 있는 그룹’</p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2>Twice?</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="../resources/images/storeimg/chrismass_4.jpg" width="140" height="140" alt="">
									<p>멤버들의 파이팅 구호는 TWICE! TWICE! 잘하자!이다.</p>
								</li>
								<br /><br />
								<li><img src="../resources/images/storeimg/chrismass_6.jpg" width="140" height="140" alt="">
									<p>멤버들이 제일 좋아하는 팬들의 응원 구호는 멤버들 이름을 차례대로 부르는 것이다.</p>
								</li>
								<li><img src="../resources/images/storeimg/chrismass_7.jpg" width="140" height="140" alt="">
									<p>인사말에서 사용하는 'ONE IN A MILLION' 백만 개의 그룹 중에서 최고가 되겠다는 의미다.</p>
								</li>
							</ul>
						</section>
					</div>
					<div class="6u">
						<section>
							<header>
								<h2>To Twice</h2>
							</header>
							<a href="#" class="image full"><img src="../resources/images/storeimg/banner_twice12.png" alt=""></a>
							<p>ONE IN A MILLION! 안녕하세요. TWICE입니다! TWICE는 JYP엔터테인먼트에서 2015년에 선보인 9인조 걸그룹이다.
엠넷의 서바이벌 프로그램 SIXTEEN을 통해 나연, 정연, 모모, 사나, 지효, 미나, 다현, 채영, 쯔위(나이 순)가 선발되어 지금의 TWICE 멤버로 활동하고 있다.</p>
						</section>
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div class="container">
				<div class="row">
					<div class="8u">
						<section>
							<header>
								<h2>Twice History</h2>
							</header>
							<p>그룹명인 TWICE는 눈으로 한 번, 귀로 한 번 감동을 준다는 의미로 박진영이 SIXTEEN을 진행하는 동안 지은 이름이다. 브랜드 네이미스트 박재현은 마이 리틀 텔레비전 방송에서 근래 데뷔한 아이돌 중 가장 좋은 팀명이라고 평가했다. 발음적으로 강한 소리가 있어 인식하기 쉽고, 유명한 단어지만 익숙하지는 않아서 신선함을 갖췄다는 평. 애칭은 '트둥이'로, TWICE와 막둥이의 합성어이다.[6] 데뷔 당시 JYP의 막내 그룹이라는 의미로 붙은 애칭이다.</p>
							<p>T와 W가 연결된 공식 로고는 트와이스 공식 활동 전방면에 사용되고 있다. 공식 SNS계정, 유튜브 채널에서는 매 앨범마다 컨셉 색에 맞게 로고를 업데이트해서 프로필 사진으로 쓰고 있다.</p>
							<p>시그니처 사운드는 멤버들이 다 함께 트와이스!라고 외치는 사운드이다.</p>
						</section>
					</div>
					<div class="4u">
						<section>
							<header>
								<h2>Twice License</h2>
							</header>
							<ul class="style">
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Phasellus nec erat sit pellentesque congue.</a></li>
								<li><a href="#">Cras vitae metus pellentesque pharetra.</a></li>
								<li><a href="#">Maecenas vitae orci vitae  feugiat eleifend.</a></li>
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Maecenas vitae orci  tellus feugiat eleifend.</a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
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
		<%
		} 
		%>
		
		
<% 
	/* 유저, 관리자가 아닐 떄  */
}	else {
	%>
	<div id="header">
			<div class="container">

				<!-- 로고 -->
				<div id="logo">
					<h1><a href="../">twentyOnce</a></h1>
				</div>

				<!-- Nev -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="list">PRODUCTION</a></li>
						<li><a href="#">SALE</a></li>
						<li><a href="cartList?userId=<%=memdto.getId() %>">SHOPPING CART</a></li>
						<li><a href="orderList?userId=<%=memdto.getId()%>">ORDER LIST</a></li>
						<li><a href="twocolumn2.html">EVENT</a></li>
						<li><a href="onecolumn.html">COMMUNITY</a></li>
					</ul>
				</nav>

			</div>
		</div>
	
		<!-- 슬라이더 -->
		<div class="autoplay" align="center" style="width: 1902px; height: 600px">
		    <div><img src="../resources/images/front_img/chrisjihyo1.jpg"/></div>
		    <div><img src="../resources/images/front_img/chrisnayeon1.jpg"/></div>
		    <div><img src="../resources/images/front_img/chrissana1.jpg"/></div>
		    <div><img src="../resources/images/front_img/chrismina1.jpg"/></div>
		</div>
		
		<div id="featured">
			<div class="container">
			
				<span class='green_window'>
						<input type='text' class='input_text' placeholder="검색어를 입력하세요." />
				</span>
						<button type='submit' class='sch_smit'>검색</button>
				<br/><br/><br/>
				<div class="row">
					<!-- 상품 목록 출력 -->
					<c:forEach items="${list }" var="dto">
						<div class="3u">
							<section>
								<div class="sample_image">
									<a href="content_view?sto_code=${dto.sto_code }" class="image full"><img src="../resources/images/stoimg/${dto.sto_imageurl }" alt="" style="width: 282px; height: 243px;" ></a>
								</div>
								<header>
									<h2>${dto.sto_name }</h2>
								</header>
								<p><fmt:formatNumber pattern="###,###,###" value="${dto.sto_price }" />원</p>				
							</section>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 인기 상품 태그 -->
		<div id="marketing">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section id="my_first">
							<header>
								<h2>Twice INFORMATION</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="../resources/images/storeimg/chrismass_1.jpg" width="260" height="260" alt="">
									<p>춤으로 유명한 JYP 소속 아티스트답게 평균 춤 실력 자체는 상당히 준수하다. 멤버들 중 쯔위와 정연을 제외하면[24] 키는 160 내외로 대체로 비슷해서 안무대형을 설 때나 군무를 출 때 보기가 좋고, 비율이 좋아 춤이 시원시원해 보이고 춤선이 예뻐 보이는 게 장점이다. </p>
								</li>
								
								<li><img src="../resources/images/storeimg/chrismass_2.jpg" width="260" height="260" alt="">
									<p>안무는 대부분 복잡하거나 격한 동작이 적고, 노래 가사를 반영한 따라하기 쉬운 포인트 동작, 귀여운 킬링 파트와 멤버 간 협동을 강조한 군무가 많다. 곡들마다 독특한 대형과 구성[25]을 가지고 차별화된 느낌을 주며, 가사를 그대로 동작으로 표현하되 곡의 느낌과 스타일에 맞는 포인트 동작을 많이 배치해 기억 속에 쉽게 남고, 곡이 쉽게 각인되도록 하는 게 트와이스의 전략이자 인기요인 중 하나다.</p>
								</li>
								<li><img src="../resources/images/storeimg/chrismass_3.jpg" width="260" height="260" alt="">
									<p>TWICE의 가장 큰 장점으로는 9명 모두 예쁘다는 평을 들으며, 평균 비주얼이 높다는 것이다. 그래서 붙여진 별명이 ‘예쁜 애 옆에 예쁜 애 옆에 예쁜 애가 있는 그룹’</p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2>Twice?</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="../resources/images/storeimg/chrismass_4.jpg" width="140" height="140" alt="">
									<p>멤버들의 파이팅 구호는 TWICE! TWICE! 잘하자!이다.</p>
								</li>
								<br /><br />
								<li><img src="../resources/images/storeimg/chrismass_6.jpg" width="140" height="140" alt="">
									<p>멤버들이 제일 좋아하는 팬들의 응원 구호는 멤버들 이름을 차례대로 부르는 것이다.</p>
								</li>
								<li><img src="../resources/images/storeimg/chrismass_7.jpg" width="140" height="140" alt="">
									<p>인사말에서 사용하는 'ONE IN A MILLION' 백만 개의 그룹 중에서 최고가 되겠다는 의미다.</p>
								</li>
							</ul>
						</section>
					</div>
					<div class="6u">
						<section>
							<header>
								<h2>To Twice</h2>
							</header>
							<a href="#" class="image full"><img src="../resources/images/storeimg/banner_twice12.png" alt=""></a>
							<p>ONE IN A MILLION! 안녕하세요. TWICE입니다! TWICE는 JYP엔터테인먼트에서 2015년에 선보인 9인조 걸그룹이다.
엠넷의 서바이벌 프로그램 SIXTEEN을 통해 나연, 정연, 모모, 사나 , 지효, 미나, 다현, 채영, 쯔위(나이 순)가 선발되어 지금의 TWICE 멤버로 활동하고 있다.</p>
						</section>
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div class="container">
				<div class="row">
					<div class="8u">
						<section>
							<header>
								<h2>Twice History</h2>
							</header>
							<p>그룹명인 TWICE는 눈으로 한 번, 귀로 한 번 감동을 준다는 의미로 박진영이 SIXTEEN을 진행하는 동안 지은 이름이다. 브랜드 네이미스트 박재현은 마이 리틀 텔레비전 방송에서 근래 데뷔한 아이돌 중 가장 좋은 팀명이라고 평가했다. 발음적으로 강한 소리가 있어 인식하기 쉽고, 유명한 단어지만 익숙하지는 않아서 신선함을 갖췄다는 평. 애칭은 '트둥이'로, TWICE와 막둥이의 합성어이다.[6] 데뷔 당시 JYP의 막내 그룹이라는 의미로 붙은 애칭이다.</p>
							<p>T와 W가 연결된 공식 로고는 트와이스 공식 활동 전방면에 사용되고 있다. 공식 SNS계정, 유튜브 채널에서는 매 앨범마다 컨셉 색에 맞게 로고를 업데이트해서 프로필 사진으로 쓰고 있다.</p>
							<p>시그니처 사운드는 멤버들이 다 함께 트와이스!라고 외치는 사운드이다.</p>
						</section>
					</div>
					<div class="4u">
						<section>
							<header>
								<h2>Twice License</h2>
							</header>
							<ul class="style">
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Phasellus nec erat sit pellentesque congue.</a></li>
								<li><a href="#">Cras vitae metus pellentesque pharetra.</a></li>
								<li><a href="#">Maecenas vitae orci vitae  feugiat eleifend.</a></li>
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Maecenas vitae orci  tellus feugiat eleifend.</a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
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
	
	<% 
		}
    %>  	
</body>
</html>