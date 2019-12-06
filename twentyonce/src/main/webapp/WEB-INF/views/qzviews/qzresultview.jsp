<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@page import="twentyOnce.qz.dto.QuizProgress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

QuizProgress qprogress=(QuizProgress)request.getSession().getAttribute("qprogress");
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
//memdto.setTier(qprogress.getCorrectnum());

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
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

<h3>qzresultview입니다</h3>
<br>
맞은 개수: <%=qprogress.getCorrectnum() %>/<%=qprogress.getQuizturn() %>
<br>
당신의 회원 등급은 <%=memdto.getTier() %>입니다.
<br>
당신의 포인트는 <%=memdto.getPoint() %>입니다.

</body>
</html>
<%
request.getSession().removeAttribute("qprogress");
%>

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