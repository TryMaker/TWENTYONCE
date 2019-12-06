<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<style>
#footer {
   z-index: 1;
   position: fixed;
   top: 93%;
   left: 0%;
   width: 100%;
   height: 100%;
   background: white;
}

#social {
   text-align: center;
   padding-top: 10px;
}	
	
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }

 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 .deliveryChange { text-align:right; }
 .delivery1_btn,
 .delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<style>
	.top_info2{
   text-align: end;
   font-size: 13px;
   margin-top: -85px;
}

.top_info2 .member{
   color: white;
   
}
</style>

	<link rel="stylesheet" type="text/css" href="../resources/css/storecss/store.css">
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/skel-noscript.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/store_style_cartlist2.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/style-desktop.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/maincss/submenu.css">
<body>
	<!-- 메뉴 -->
		<div id="header">
			<div class="container">
              <div class="top_info2">
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
						<li><a href="../mainviews/video">VIDEO</a></li>
						<li><a href="../wcviews/wcview">DUCKZIL</a>
							<ul>
								<li><a href="../wcviews/wcview">WORLDCUP</a></li>
								<li><a href="../qzviews/qzstartview">QUIZ</a></li>
							</ul>
						</li>
						<li><a href="cartList?userId=<%=memdto.getId() %>">SHOPPING CART</a></li>
						<li><a href="orderList?userId=<%=memdto.getId()%>">ORDER LIST</a></li>
					</ul>
				</nav>
			</div>
		</div>

<!-- 관리자일 때 -->
		<section id="content">
		 <ul class="orderList">
		  <c:forEach items="${orderList}" var="orderList">
		  <li>
		  <div>
		   <p><span>주문번호</span><a href="orderView?orderId=${orderList.orderId}&userId=${orderList.userId}">${orderList.orderId}</a></p>
		   <p><span>수령인</span>${orderList.orderRec}</p>
		   <p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
		   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
		   <p><span>상태</span>${orderList.delivery }</p>
		   
		  	</div>
		  	</li>
		  </c:forEach>
		 </ul>
	</section> 

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