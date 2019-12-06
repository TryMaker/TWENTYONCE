<%@page import="twentyOnce.qz.dto.QuizProgress"%>
<%@page import="twentyOnce.qz.dto.QuizDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

QuizDto qdto=(QuizDto)request.getSession().getAttribute("qdto");
QuizProgress qprogress=(QuizProgress)request.getSession().getAttribute("qprogress");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/common_css/main.css">
<!-- <link type="text/css" rel="stylesheet" href="../resources/css/maincss/menubar.css"> -->
<title>Insert title here</title>

<script type="text/javascript">

function goNext(a) { //다음 이동
	
	//체크 여부 확인
	var isCheck = false;
    var arr_cb = document.getElementsByName("checkbox");
    var answer="";
    
    for(var i=0;i<arr_cb.length;i++){
        if(arr_cb[i].checked == true) {
            isCheck = true;
            answer=arr_cb[i];
            break;
        }
    }
	
	if(!isCheck) { //체크 안 함
		alert("하나 이상 체크");
		return false;
		
	} else { //다음 문제
		return answer;
		
	}
}


function oneCheckbox(a){ //체크박스 하나만

    var obj = document.getElementsByName("checkbox");

    for(var i=0; i<obj.length; i++){

        if(obj[i] != a){

            obj[i].checked = false;

        }
    }
}

</script>

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
                  <li><a href="../stoviews/list">VIDEO</a></li>
                  <li><a href="../wcviews/wcview">DUCKZIL</a></li>
               </ul>
            </nav>
         </div>
      </div>
      
      <br>
<br>
<br>
<div class="jb-wrap">
<label>
<%=qprogress.getQuizturn()+1 %>.
<%=qdto.getQz_quiz() %>
</label>
<br>
<br>
<div class="jb-image"><img src="../resources/images/boardimg/chalkboard.png" ></div>
<div class="jb-text" >
<form name="quizInfo" action="qzview" method="post" onsubmit="return goNext(this)">
<label><%=qdto.getQz_choicea() %></label>
<input name="checkbox" type="checkbox" value="1" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choiceb() %></label>
<input name="checkbox" type="checkbox" value="2" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choicec() %></label>
<input name="checkbox" type="checkbox" value="3" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choiced() %></label>
<input name="checkbox" type="checkbox" value="4" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choicee() %></label>
<input name="checkbox" type="checkbox" value="5" onclick="oneCheckbox(this)">
<br>
<br>
<input type="submit" value="다음 문제">
</form>
</div>
</div>
<br><br><br><br><br>

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