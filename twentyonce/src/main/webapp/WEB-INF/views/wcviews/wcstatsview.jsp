<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.wc.dto.NomineeDto"%>

<%

ArrayList<NomineeDto> statslist=(ArrayList)request.getAttribute("statslist");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<link type="text/css" rel="stylesheet" href="../resources/css/maincss/menubar.css">
<title>Insert title here</title>

<style>

#wcstatspage {
	margin: 100px;
}

/* UI Object 가로 */
.h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
.h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
.h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
.h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
.h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
/* //UI Object */
</style>

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

<div id="wcstatspage">

<h3>결과화면</h3>
<br>

<%
for(int i=0; i<statslist.size(); i++) {
	NomineeDto nom=statslist.get(i);
	
	double win=nom.getWc_win();
	double match=nom.getWc_match();
	
	double winRate=(win/match)*100;
	
	double champion=nom.getWc_champion();
	double game=nom.getWc_game();
	
	double championRate=(champion/game)*100;
%>
제목: <%=nom.getWc_title() %><br>
승률: <%=winRate %>%<br>
우승비율: <%=championRate %>%<br>
<br>

<div class="h_graph">
<ul>
<li><span class="g_term">승률</span><span class="g_bar" style="width:<%=winRate/2 %>%"><span><%=winRate %>%</span></span></li>
<li><span class="g_term">우승비율</span><span class="g_bar" style="width:<%=championRate/2 %>%"><span><%=championRate %>%</span></span></li>
</ul>
</div>

<br>
<br>
<%
}
%>
<br>

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