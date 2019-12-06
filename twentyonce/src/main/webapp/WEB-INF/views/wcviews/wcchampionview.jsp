<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.wc.dto.NomineeDto"%>
    

<%

NomineeDto championDto=(NomineeDto)request.getAttribute("championDto");

%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<style type="text/css">

#wcchampionpage {
	margin: 50px;
}

#champpic, #champdetail {
	float: left;
	width: 50%;
}

</style>
<title>Insert title here</title>
</head>
<body>

<div id="header">
         <div class="container">
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
                  <li><a href="../stoviews/list">VIDEO</a></li>
                  <li><a href="../wcviews/wcview">DUCKZIL</a></li>
               </ul>
            </nav>
         </div>
      </div>
      
      <br>
      
      <div id="wcchampionpage">

<h3>championview</h3><br>
<br>
<div id="champpic">

<img alt="" src="<%=championDto.getWc_memory() %>">
<br>

</div>

<div id="champdetail">

제목: <%=championDto.getWc_title() %><br>
승리수: <%=championDto.getWc_win() %><br>
매치수: <%=championDto.getWc_match() %><br>
우승수: <%=championDto.getWc_champion() %><br>
<br>
<a href="wcstatsview">통계 보기</a>
<br>

</div>

</div>

<br>
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