<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>

<% 	
	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto == null?false:true;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../resources/css/common_css/main.css">
<link type="text/css" rel="stylesheet"href="../../resources/css/brd_css/tnotice_detail.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/maincss/submenu.css">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script type="text/javascript">
            $(document).ready(function(){
                CKEDITOR.replace( 'content' );
                CKEDITOR.config.height = 400;
                CKEDITOR.config.width = 700;
                 
                $("#list").click(function(){
                    location.href = "/twentyOnce/brdviews/not_Notice/list";
                });
                 
                $("#save").click(function(){
                     
                    //에디터 내용 가져옴
                    var content = CKEDITOR.instances.content.getData();
                    
                    //널 검사. (아이디가 # 인 input요소의 값을 공백을 제거하고 가져옴) 그게 공백이라면
                    if($("#subject").val().trim() == ""){
                        alert("제목을 입력하세요.");
                        $("#subject").focus();
                        return ;
                    }
                     
                    if($("#writer").val().trim() == ""){
                        alert("작성자를 입력하세요.");
                        $("#writer").focus();
                        return ;
                    }
                  
                    
                    document.form2.submit();
                    
                });
            });
                 
        </script>
</head>
<body>
<body>
<div id="header">
        <div class="container">
                 <div class="top_info">
 	<%
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
			<a href="../../memviews/mypage" class="member" ><%=memdto.getId()%></a>&nbsp |&nbsp
			<a href="../../memviews/logout" class="member" >LOGOUT</a> &nbsp 
			<%
			if (memdto.isAdmin()) {
				%>
			<a href="../../visviews/visstatsview" class="member" >[ADMIN PAGE]</a>
			<%
			}
			%>
		</div>
            <div id="logo">
                <h1><a href="../../">twentyOnce</a></h1>
            </div>
			
            <nav id="nav">
               	<ul>
						<li class="active"><a href="../../frontAfterviews/twfrontAfter">MAIN</a></li>
						<li><a href="./list">NOTICE</a></li>
						<li><a href="../../stoviews/list">STORE</a></li>
						<li><a href="../../schviews/schedule">SCHEDULE</a></li>
						<li><a href="../../stoviews/list">VIDEO</a></li>
						<li><a href="../../wcviews/wcview">DUCKZIL</a>
							<ul>
								<li><a href="../wcviews/wcview">WORLDCUP</a></li>
								<li><a href="../qzviews/qzstartview">QUIZ</a></li>
							</ul>
						</li>
					</ul>
            </nav>
        </div>
    </div>
    
<form action="modify" method="post" name="form2">
<input type="hidden" name="not_num" value="${content_modify.num }" />
<%= request.getRequestURI() %>
	<div align="center">
		
		<table width="1200px">
			<tr>	
				<td>TITLE: <input type="text" id="subject" name="not_title"
					style="width: 600px;" placeholder="제목" value="${content_modify.title}" />
			</tr>
			<tr>
				<td>NAME: <input type="text" id="writer" name="not_name"
					style="width: 170px;" maxlength="10" placeholder="수정할 것 각각 게시판뜻대로" value="${content_modify.name}"/>
				</td>
			</tr>
			<tr>
				<td><textarea id="content" name="not_content" rows="10"
						cols="80">${content_modify.content}</textarea></td>
			</tr>
			<tr>
				<td align="right">
					<button id="list" name="list">게시판</button>
					<button id="save" name="save">저장</button>
				</td>
			</tr>
		</table>
	</div>
	</form>
	
<!-- 소셜 -->
             <div id="footer">
                <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="../../resources/images/mainimg/facebook.PNG" alt="facebook"></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="../../resources/images/mainimg/instargram.PNG" alt="instargram"></a>
                <a href="https://twitter.com/JYPETWICE"><img src="../../resources/images/mainimg/twitter.PNG" alt="twitter"></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="../../resources/images/mainimg/youtube.PNG"></a>
                <a href="https://fans.jype.com/Portal"><img src="../../resources/images/mainimg/fans.PNG" alt="fans"></a>
                </div>
               </div>
</body>

</html>