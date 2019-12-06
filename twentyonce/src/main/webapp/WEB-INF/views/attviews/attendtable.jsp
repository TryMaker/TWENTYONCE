
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="twentyOnce.att.dto.CalendarResource"%>
<%-- <%@page import="twentyOnce.sch.dto.ScheduleDto"%> --%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 
<%

String boxSize = "70";

boolean flagSch=false; //스케줄 클릭했는지 여부
boolean flagLoc=false; //지도 가져왔는지 여부

CalendarResource calsource=(CalendarResource)request.getAttribute("calsource");

int currYear=calsource.getCurrYear();
int currMonth=calsource.getCurrMonth();
Calendar c=calsource.getC();
Calendar cal=calsource.getCal();

int dispDay=1;

//출석 리스트
ArrayList<String> attDateList=(ArrayList)request.getAttribute("attdatelist");

%>

<%! //메소드: 날짜 실제 여부

    public boolean isDate(int y, int m, int d) {
   
         m -= 1;
         Calendar c = Calendar.getInstance();
         c.setLenient(false);
       
         try {
              c.set(y, m, d);
              Date dt = c.getTime();
             
         } catch(IllegalArgumentException e) {
       	  
              return false;
         }
         
         return true;
    }

%>

<%! //메소드: 제목 형식

    public String getTitle(Calendar cal){
       
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월");
         return sdf.format(cal.getTime());    
    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/maincss/submenu.css">
<title>JSP 달력(Calendar)</title>

<style>
   
   #calendarTable, #calendarTable th, #calendarTable td   {
       border-collapse: collapse;
                   
   }
   
   #calendarTable {
       border:2px solid #000;
       width:600px;//달력크기. 519px이었음.
   }
   
   #calendarTable th, #calendarTable td {
       width: <%=boxSize%>px;
       border:1px solid #000;        
       border-collapse: collapse;
       padding: 5px;        
   }
   
   #calendarTable th {        
       background-color: #666;
       color: #fff;
       
   }    
   #calendarTable td {        
       height: <%=boxSize%>px;
       text-align : left;            
   }
   
   #calendarTable td.empty {
       background-color: #DFDCD8;
   }
   
   #calendarTable td.toDayColor {
       background-color: #6C7EAA;
   }
   
   
</style>

<script type="text/javascript">

	function stampClicked() {
		/* alert("이동한다"); */
		location.href="attendtable?stamp=1";
		<%-- location.href="attendtable?stamp=1&day<%=dispDay%>&month=<%=currMonth%>&year=<%=currYear%>"; --%>
	}

</script>

</head>

<body bgcolor='white'>
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
            <!-- 로고 -->
            <div id="logo">
                <h1><a href="../frontAfterviews/twfrontAfter">twentyOnce</a></h1>
            </div>

            <!-- Nev -->
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
<div>

<table border='0' width='600' cellpadding='0' cellspacing='0'>
<!-- width=521이었음. -->
 <tr>
    <td width='150' align='right' valign='middle'>
        <a href="attendtable?month=<%=currMonth%>&year=<%=currYear%>&action=0">
            <font size="2">이전달</font>
        </a>
    </td>
    <td width='220' align='center' valign='middle'>
        <b><%= getTitle(cal)%></b>
    </td>
    <td width='150' align='left' valign='middle'>
        <a href="attendtable?month=<%=currMonth%>&year=<%=currYear%>&action=1">
            <font size="2">다음달</font>
        </a>
   </td>
 </tr>
</table>
<br>
<table>
 <tr>        
 <td width="100%" >
   <table id="calendarTable">
      <tr>
             <th>일</th>
             <th>월</th>
             <th>화</th>
             <th>수</th>
             <th>목</th>
             <th>금</th>
             <th>토</th>                      
      </tr>
<%
//달력 출력

    String todayColor; //오늘 색깔 구분
    String stampClick="";
    int count = 1; //달력 칸 순서
    //dispDay = 1; //날짜(일)

    for (int w = 1; w < 7; w++) //달력 세로칸 수 (<tr>로 줄바꿈)
    {
%>

      <tr>
<%
         for (int d = 1; d < 8; d++) //달력 가로칸 수
         {
              if (!(count >= cal.get(Calendar.DAY_OF_WEEK))) //여기는 실제 날짜 시작 전임.
              {
%>
         <td class="empty">&nbsp;</td>
<%
                   count += 1; //1칸 더함.
              }
              else
              {
                   if (isDate(currYear, currMonth+1, dispDay)) // isDate메소드로 실제 날짜인지 확인.
                   {
                        if (dispDay == c.get(Calendar.DAY_OF_MONTH) && //여기는 오늘임.
                           c.get(Calendar.MONTH) == cal.get(Calendar.MONTH)
                               && c.get(Calendar.YEAR) == cal.get(Calendar.YEAR))
                        {
                            todayColor = "class='toDayColor'";
                            
                            boolean flag=true;
                            for(int i=0; i<attDateList.size(); i++) {
                            	String date=attDateList.get(i);
                            	if(Integer.parseInt(date)==dispDay) {
                            		flag=false;
                            	}
                            }
                            if(flag==true) {
                            	 stampClick="onClick=stampClicked() style=cursor:pointer;";
                            } else {
                            	stampClick="";
                            }
                            
                        }
                        else //여기는 오늘이 아님.
                        {
                            todayColor = "";
                        }
%>

         <td <%=todayColor%> <%=stampClick %>><%=dispDay%><br>
<%


for(int i=0; i<attDateList.size(); i++) {
	String date=attDateList.get(i);
	if(Integer.parseInt(date)==dispDay) {
%>
	<img alt="" src="..\resources\images\attimg\stamp.png">
<%
	}
}
%>
         </td>
<%
						dispDay += 1; //1일 더함.
                     	count += 1; //1칸 더함.
                   }
                   else //여기는 실제 날짜 끝난 후임.
                   {
%>
         <td class="empty">&nbsp;</td>
<%
					}
				}
      }
}
%>
      </tr>
    </table>
    </td>
    </tr>
 </table>
 
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