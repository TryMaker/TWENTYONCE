<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.vis.dto.StatsDto"%>
<%@page import="twentyOnce.vis.dto.GraphDto"%>
<%@page import="twentyOnce.vis.dto.DateDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
    
<%

System.out.println("===========================");

//통계 상세 보기
DateDto datedto=(DateDto)request.getAttribute("datedto");

int year=datedto.getYear();
int month=datedto.getMonth();
int day=datedto.getDay();

int currYear=datedto.getCurrYear();
int currMonth=datedto.getCurrMonth();
int currDay=datedto.getCurrDay();

ArrayList<GraphDto> grphlist=(ArrayList)request.getAttribute("grphlist");

for (int i = 0; i < grphlist.size(); i++) {
	GraphDto dto=grphlist.get(i);
	System.out.println(i+"번");
	System.out.println("date: "+dto.getGrphdate());
	System.out.println("count: "+dto.getGrphcount());
}

StatsDto statdto=(StatsDto)request.getAttribute("statdto");
int avgviews=statdto.getAvgviews();

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/maincss/submenu.css">
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
			<a href="../memviews/mypage" class="member" ><%=memdto.getId()%> (<%=memdto.getName() %>)</a>&nbsp |&nbsp
			<a href="../memviews/mypage" class="member" >LOGOUT</a> &nbsp 
			<%
			if (memdto.isAdmin()) {
				%>
			<a href="./visstatsview" class="member" >[ADMIN PAGE]</a>
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
<br>
<br>

ㅇ통계 요약
<br>
<br>
총 방문수: ${statdto.totalviews }<br>
일간 방문수: ${statdto.dailyviews }<br>
주간 방문수: ${statdto.weeklyviews }<br>
월간 방문수: ${statdto.monthlyviews }<br>
<br>
<br>

ㅇ통계 상세 보기
<br>
<br>

<a href="visstatsview?year=<%=datedto.getYear() %>&month=<%=datedto.getMonth() %>&day=<%=datedto.getDay()-1 %>">
1일 전</a>
<br>
<br>

<%if (!(year==currYear&&month==currMonth&&day==currDay)) {%>
<a href="visstatsview?year=<%=datedto.getYear() %>&month=<%=datedto.getMonth() %>&day=<%=datedto.getDay()+1 %>">
1일 후</a>
<br>
<br>
<%} %>

<%=statdto.getStandardTime() %>
<br>
2주일치 통계 자료
<br>
<br>

<div id="chart_div"></div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawTrendlines);

function drawTrendlines() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', '일일 방문자');
      data.addColumn('number', '평균');

      data.addRows([
          [<%=grphlist.get(0).getGrphdate()%>, <%=grphlist.get(0).getGrphcount() %>, <%=avgviews %>], 
          [<%=grphlist.get(1).getGrphdate()%>, <%=grphlist.get(1).getGrphcount() %>, <%=avgviews %>],
          [<%=grphlist.get(2).getGrphdate()%>, <%=grphlist.get(2).getGrphcount() %>, <%=avgviews %>], 
          [<%=grphlist.get(3).getGrphdate()%>, <%=grphlist.get(3).getGrphcount() %>, <%=avgviews %>],
          [<%=grphlist.get(4).getGrphdate()%>, <%=grphlist.get(4).getGrphcount() %>, <%=avgviews %>], 
          [<%=grphlist.get(5).getGrphdate()%>, <%=grphlist.get(5).getGrphcount() %>, <%=avgviews %>],
          [<%=grphlist.get(6).getGrphdate()%>, <%=grphlist.get(6).getGrphcount() %>, <%=avgviews %>], 
          [<%=grphlist.get(7).getGrphdate()%>, <%=grphlist.get(7).getGrphcount() %>, <%=avgviews %>],  
          [<%=grphlist.get(8).getGrphdate()%>, <%=grphlist.get(8).getGrphcount() %>, <%=avgviews %>],  
          [<%=grphlist.get(9).getGrphdate()%>, <%=grphlist.get(9).getGrphcount() %>, <%=avgviews %>],  
          [<%=grphlist.get(10).getGrphdate()%>, <%=grphlist.get(10).getGrphcount() %>, <%=avgviews %>],  
          [<%=grphlist.get(11).getGrphdate()%>, <%=grphlist.get(11).getGrphcount() %>, <%=avgviews %>], 
          [<%=grphlist.get(12).getGrphdate()%>, <%=grphlist.get(12).getGrphcount() %>, <%=avgviews %>], 
          [<%=grphlist.get(13).getGrphdate()%>, <%=grphlist.get(13).getGrphcount() %>, <%=avgviews %>],
          [<%=grphlist.get(14).getGrphdate()%>, <%=grphlist.get(14).getGrphcount() %>, <%=avgviews %>]
        ]);

      var options = {
        hAxis: {
          title: '날짜(일)'
        },
        vAxis: {
          title: '인원(명)'
        },
        colors: ['#AB0D06', '#007329'],
        trendlines: {
          0: {type: 'exponential', color: '#333', opacity: 1},
          1: {type: 'linear', color: '#111', opacity: .3}
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
</script>

<br>

<br>
<br>
방문 합계: <%=statdto.getTwoweeksviews() %>회<br>
평균 페이지뷰: <%=statdto.getAvgpageviews() %>페이지<br>
평균 사용 시간: <%=statdto.getAvgusemins() %>분<br>
가장 많이 접속한 아이디: '<%=statdto.getMaxuseid() %>'님<br>

<!-- 
일일 방문수의 2주일치
(
왼쪽 오른쪽 버튼으로
기준이 되는 날을 바꿀 수 있음.
)
​
평균 페이지뷰
평균 사용 시간
가장 많이 이용한 아이디
 -->
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