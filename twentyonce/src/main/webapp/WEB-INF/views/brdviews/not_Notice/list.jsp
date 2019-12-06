<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>

<% 	
	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto == null?false:true;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet" href="../../resources/css/brd_css/nstyle2.css"> 
<link rel="stylesheet" type="text/css" href="../../resources/css/common_css/main.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/maincss/submenu.css">
<title>TWICE 게시판</title>
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
</style>


<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
		<script type="text/javascript">
			
			function fn_list(page) {
				var searchType = $("#sel_searchType option:selected").val();
				var searchKeyword = $("#sel_searchkw").val();
				window.location.href="/twentyOnce/brdviews/not_Notice/list?curPage="+page+"&searchType="+searchType+"&searchkw="+searchKeyword;
				
			}
			function fn_contentview(not_num,curPage){
				window.location.href="/twentyOnce/brdviews/not_Notice/content_view?curPage="+curPage+"&not_num="+not_num+"&searchType="+"${paramMap.searchType}"+"&searchkw="+"${paramMap.searchkw}";
			}
			
			function fn_searchCC() {
				// 선택된 옵션의 text, value값 구하기
				var searchType = $("#sel_searchType option:selected").val();
				var searchKeyword = $("#sel_searchkw").val();
				//검색 할 때마다 1페이지. 페이지 변환시 타입과 키워드 전달
				window.location.href="/twentyOnce/brdviews/not_Notice/list?curPage=1&searchType="+searchType+"&searchkw="+searchKeyword;	
			}
		</script>
		
</head>
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
						<li><a href="../../mainviews/video">VIDEO</a></li>
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

	<table border="0" id="board_twidth" >
	<caption id="board_link"><a href="./list">home</a> /&nbsp notice</caption>
	<thead id="board_head">
		<tr>
			<th>num</th>
			<th>title</th>
			<th>name</th>
			<th>date</th>
			<th>view</th>
		</tr>
		</thead>
		<%-- 		 ${}를 이용해서 데이터값을 가져온다. --%>
<tbody id="board_body">
		<c:forEach items="${paramMap.list}" var="dto">
			<tr>
				<td>${dto.not_num }</td>

				<td><a href="javascript:fn_contentview('${dto.not_num}','${paramMap.paging.curPage}')">
						${dto.not_title }</a></td>

				<td>${dto.not_name }</td>
				<td><fmt:formatDate value="${dto.not_date}"
						pattern="yyyy.MM.dd" /></td>
				<td>${dto.not_view }</td>
			</tr>
		</c:forEach>
</tbody>
<tfoot id="board_foot">
		<tr>
		<!-- 로그인한 사용자만 글쓰기 버튼 활성화하기 -->
		<% if(memdto.isAdmin()==true){ %>
		<td colspan="5">
		<a href="write_view"><input type="button" value="write"></a></td>
		<%} %>
		</tr>
</tfoot>
	</table>
	<!-- paging -->

		<div id="board_paging">
				<c:if test="${paramMap.paging.curPage>1 }">
					<!-- 현재페이지가 1보다 클때 -->
					<!-- 처음을 누르면 1페이지로 -->
					<a href="javascript:fn_list('1')">[처음]</a>
					</c:if>
					<c:if test="${paramMap.paging.curBlock>1 }">
					<!-- 이전 페이지 블록으로 이동. 현재 페이지 블록이 1보다 크다면 -->
					<a href="javascript:fn_list('${paramMap.paging.prevPage}')">[이전]</a>
					</c:if>
			
				<c:forEach  begin="${paramMap.paging.blockBegin }" end="${paramMap.paging.blockEnd}" var="i" step="1">
					<!-- 하나의 블록 시작 페이지 ~ 끝 페이지 -->
					<c:choose>
						<c:when test="${i eq paramMap.paging.curPage }">
							<!-- 위에 변수 i의 값과 현재 페이지의 값이 같을때 -->
							<span style="color:orange"> ${i} </span>
						</c:when>
						<c:otherwise>
							<a href="javascript:fn_list('${i }')"><c:out value="${i }"></c:out></a>
							
							<!-- 			이거 없음 페이지 이동식 데이터 값 안들고 간다~~ -->
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paramMap.paging.curPage <= paramMap.paging.totBlock }">
					<a href="javascript:fn_list('${paramMap.paging.nextPage }')">[다음]</a>
					</c:if>
					<c:if test="${paramMap.paging.curPage < paramMap.paging.totPage }">
					<a href="javascript:fn_list('${paramMap.paging.totPage }')">[마지막]</a>
				</c:if>

		</div>
         <div id="board_search"> 
 			<select name="searchType" id="sel_searchType" >
 			<c:choose>
 			<c:when test="${paramMap.searchType =='not_title'}">
				<option value="not_title" selected="selected">제목</option>
				<option value="not_content"	>내용</option>
				<option value="not_name" >작성자</option>
				</c:when>
			<c:when test="${paramMap.searchType =='not_content'}">
				<option value="not_title" >제목</option>
				<option value="not_content"	selected="selected">내용</option>
				<option value="not_name" >작성자</option>
				</c:when>
				
		<c:otherwise>
				<option value="not_title" >제목</option>
				<option value="not_content"	>내용</option>
				<option value="not_name" selected="selected">작성자</option>
       </c:otherwise>				
				</c:choose>
				</select>
				
		<input type="text" name="searchkw" id="sel_searchkw" style="width: 150px;" maxlength="50"
				value="${paramMap.searchkw }" placeholder="Search" /> 
				
		<a href="javascript:fn_searchCC()" class="btn_search">검색</a> 
 		</div> 
	
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


