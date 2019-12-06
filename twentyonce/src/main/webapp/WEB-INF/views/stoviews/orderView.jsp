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

 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 .deliveryChange { text-align:right; }
 .delivery1_btn,
 .delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>orderView</title>
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

<!-- 상품 배너 -->
		<section id="content">
 <div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
   <c:if test="${status.first}">
    <p><span>수령인</span>${orderView.orderRec}</p>
    <p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
    <p><span>상태</span>${orderView.delivery}</p>
	   
	   	<div class="deliveryChange">
			 <form role="form" method="post" class="deliveryForm" action="delivery">
			 
			  <input type="hidden" name="orderId" value="${orderView.orderId}" />
			  <input type="hidden" name="delivery" class="delivery" value="" />
			  
			  <button type="button" class="delivery1_btn">배송 중</button>
			  <button type="button" class="delivery2_btn">배송 완료</button>
			  
			  <script> 
			    // 배송 중 버튼 클릭 시, delivery의 val 값을 배송 중으로 변경한다.
			    $(".delivery1_btn").click(function(){
			    	$(".delivery").val("배송 중");
			    	alert('배송 중입니다.');
			    	run();
			    });
			   
			    // 배송 완료 버튼 클릭 시, delivery의 val 값을 배송 완료로 변경한다.
			    $(".delivery2_btn").click(function(){
			    	$(".delivery").val("배송 완료");
			    	alert('배송 완료입니다.');
			     	run();			
			    });
			   
			    // run()으로 통과한 후, deliveryForm을 submit 시킨다.
			    function run(){
			    	$(".deliveryForm").submit();
			    }			  
			  </script>
			 </form>
		</div>
   </c:if>
   
  </c:forEach>
 </div> 
 
 <ul class="orderView">
  <c:forEach items="${orderView}" var="orderView"> 
  <li>
   <div class="thumb">
    <img src="../resources/images/stoimg/${orderView.sto_imageurl }" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명</span>${orderView.sto_name}<br />
     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.sto_price}" /> 원<br />
     <span>구입 수량</span>${orderView.cartStock} 개<br />
     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.sto_price * orderView.cartStock}" /> 원                  
    </p>
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