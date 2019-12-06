<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.SaveIdDto"%>

<%
	SaveIdDto iddto = (SaveIdDto) request.getAttribute("iddto");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TWICE LOGIN!!!</title>
<!--LINK css -->
 <link rel="stylesheet" href="../resources/css/mem_css/front_Login.css">
 <link rel="stylesheet" href="../resources/css/mem_css/front_Join.css">
<!--LINK script -->
 <script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디 입력");
			inputForm.id.focus();
			return false;
		}

		if (!inputForm.pw.value) {
			alert("비밀번호 입력");
			inputForm.pw.focus();
			return false;
		}
	}

$(function() {
  
  var modBtn  = $('.sign-up-button'),
      modal   = $('#modal'),
      close   = modal.find('.close'),
      modContent = modal.find('.modal-content');
  
  // open modal when click on open modal button 
  modBtn.on('click', function() {
    modal.css('display', 'block');
    modContent.removeClass('modal-animated-out').addClass('modal-animated-in');
  });
  
  // close modal when click on close button or somewhere out the modal content 
  $(document).on('click', function(e) {
    var target = $(e.target);
    if(target.is(modal) || target.is(close)) {
      modContent.removeClass('modal-animated-in').addClass('modal-animated-out').delay(300).queue(function(next) {
        modal.css('display', 'none');
        next();
      });
    }
  });
  
});

function joinSave() {
	
	if ($("#id").val().trim() == "") {
		alert("ID 입력하세요!");
		$("#id").focus();
		return;
	}
	if ($("#pw").val().trim() == "") {
		alert("PASSWORD 입력하세요!");
		$("#pw").focus();
		return;
	}
	if ($("#name").val().trim() == "") {
		alert("NAME 입력하세요!");
		$("#name").focus();
		return;
	}
	alert("당신은 이제 ONCE입니다.");
     
	document.form1.submit();
	
}

</script>
<style type="text/css">

</style>

</head>
<div id="toptop"></div>
<body>
	<form action="loginproc" id="loginForm" method="post" name="loginInfo"
		onsubmit="return checkValue()">

		<!--  로그인 폼 시작-->
		<div class="form-container">
			<div id="form-title">TWICE LOVE</div>
			
				<label for="userId">YOUR ID</label> <input type="text" name="id"
					class="text-input" value="${iddto.ids_id }" />
			<p>
				<label for="userPWD">PASSWORD</label> <input type="password"
					name="pw" class="text-input" value="${iddto.ids_pw }" />
			</p>
			<div class="login">
				<input type="submit" value="LOGIN" class="login-button" />
				<div class="sign-up-button" onclick="javascript:goJoinForm()" >SIGN UP</div>
			</div>
       <div>
			<p class="password-rec" style="text-align: center;">
				Recover Your Password <a href="#">Here</a>
			</p>
		        <p id="btn1" style="text-align: center;">
		                <label for="saveId">SAVE ID</label>
		                <input type="checkbox" name="saveId" id="saveId" value="saveIdYes" <%=iddto.getCheck() %> />
		                <label for="secure">SECURE CONTECT</label>
		                <input type="checkbox" id="secure" value="secureYes" />
		        </p>
		</div>
		
		</div>
	</form>
	
<!-- Modal -->
<!-- Modal JOIN-->
<!-- Modal -->

<form action="./joinproc" method="post" name="form1">
<div id="modal" class="modal">
  <!-- Modal Content -->
  <div class="modal-content">
    <!-- Modal Header -->
    <div class="modal-header">
      <h3 class="header-title">MEMBER JOIN</h3>
      <div class="close fa fa-close"></div>    
    </div>
    
    <!-- Modal Body -->
    <div class="modal-body">
      <h3>ONCE</h3>
      <div class="field">
      <label for="id" class="modal_join"> YOUR ID</label> 
      <input type="text" name="id" size="10" class="input" id="id"><br>
      </div>
      <div class="field">
      <label for="pw" class="modal_join"> PASSWORD</label> 
      <input type="password" name="pw" size="10" class="input" id="pw"><br>
      </div>
       <div class="field">
      <label for="name" class="modal_join"> NAME </label>
      <input type="text" name="name" size="10" class="input" id="name"><br>
       </div>
       <div class="field">
      <label for="phone" class="modal_join"> PHONE</label> 
      <input type="text" name="phone" size="10" class="input" id="phone"><br>
       </div>
       <div class="field">
      <label for="email" class="modal_join"> E-MAIL </label>
      <input type="text" name="email" size="10" class="input" id="email"><br>
       </div>
       <div class="field">
      <label for="addr" class="modal_join"> ADDRRESS </label>
      <input type="text" name="addr" size="10" class="input" id="addr"><br>
      </div>
      <button type="button" class="next" onclick="javascript:joinSave()">DONE</button>
    </div>
      
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>
</div>
</form>

</body>
</html>