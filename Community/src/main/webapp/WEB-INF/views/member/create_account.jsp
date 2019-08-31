<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Gather projects-Create Account</title>
    <c:set var="context" value="${pageContext.request.contextPath }"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A project management Bootstrap theme by Medium Rare">
    <link href="${context}/resources/assets/img/favicon.ico" rel="icon" type="image/x-icon">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
    <link href="${context}/resources/assets/css/theme.css" rel="stylesheet" type="text/css" media="all" />
  </head>

  <body>
    <div class="main-container fullscreen">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-5 col-lg-6 col-md-7">
            <div class="text-center">
              <h1 class="h2">Create account</h1>
              <p class="lead">Start doing things for free, in an instant</p>
              <button class="btn btn-lg btn-block btn-primary">
                <img alt="Google" src="${context}/resources/assets/img/logo-google.svg" class="rounded align-top mr-2" />Continue with Google
              </button>
              <hr>
              <form>
                <div class="form-group row">
                  <input class="form-control col-lg-8 ml-2" type="email" placeholder="Email Address" id="email" name="email" autocomplete="email" required="required"/>
                  <button class="btn btn-block btn-primary col-lg-3 mx-2" type="button">메일 인증</button>
                  <div class="text-left ml-2" id="emailErr">
                    <small class="text-danger"></small>
                  </div>
                </div>
                <div class="form-group row" id="auth">
                  <input class="form-control col-lg-8 ml-2" type="text" placeholder="인증 번호" name="check"/>
                  <button class="btn btn-block btn-info col-lg-3 mx-2" type="button">인증 확인</button>
                  <div class="text-left ml-2" id="authErr">
                    <small class="text-danger">인증번호가 다릅니다. 다시 시도해주세요.</small>
                  </div>
                </div>
                <div class="form-group row">
                  <input class="form-control col-lg-8 ml-2" type="text" placeholder="User Name" name="name" autocomplete="name"/>
                  <button class="btn btn-block btn-primary col-lg-3 mx-2" type="button">중복 확인</button>
                  <div class="text-left" id="nameErr">
                    <small class="text-danger"></small>
                  </div>
                </div>
                <div class="form-group">
                  <input class="form-control" type="text" placeholder="Phone Number" id="phone" name="phone" autocomplete="tel"/>
                  <div class="text-left" id="phoneErr">
                    <small class="text-danger"></small>
                  </div>
                </div>
                <div class="form-group">
                  <input class="form-control mb-1" type="password" placeholder="Password" id="pwd" name="pwd" autocomplete="new-password"/>
                  <input class="form-control" type="password" placeholder="Password Check" id="pwd2" autocomplete="new-password"/>
                  <div class="text-left" id="pwdErr">
                    <small class="text-danger">Your password should be at least 8 characters</small>
                  </div>
                </div>
                <button class="btn btn-lg btn-block btn-primary" role="button" type="submit">
                  Create account
                </button>
                <small>By clicking 'Create Account' you agree to our <a href="#">Terms of Use</a>
                </small>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Required vendor scripts (Do not remove) -->
    <script type="text/javascript" src="${context}/resources/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${context}/resources/assets/js/popper.min.js"></script>
    <script type="text/javascript" src="${context}/resources/assets/js/bootstrap.js"></script>

    <!-- Optional Vendor Scripts (Remove the plugin script here and comment initializer script out of index.js if site does not use that feature) -->

    <!-- Autosize - resizes textarea inputs as user types -->
    <script type="text/javascript" src="${context}/resources/assets/js/autosize.min.js"></script>
    <!-- Flatpickr (calendar/date/time picker UI) -->
    <script type="text/javascript" src="${context}/resources/assets/js/flatpickr.min.js"></script>
    <!-- Prism - displays formatted code boxes -->
    <script type="text/javascript" src="${context}/resources/assets/js/prism.js"></script>
    <!-- Shopify Draggable - drag, drop and sort items on page -->
    <script type="text/javascript" src="${context}/resources/assets/js/draggable.bundle.legacy.js"></script>
    <script type="text/javascript" src="${context}/resources/assets/js/swap-animation.js"></script>
    <!-- Dropzone - drag and drop files onto the page for uploading -->
    <script type="text/javascript" src="${context}/resources/assets/js/dropzone.min.js"></script>
    <!-- List.js - filter list elements -->
    <script type="text/javascript" src="${context}/resources/assets/js/list.min.js"></script>

    <!-- Required theme scripts (Do not remove) -->
    <script type="text/javascript" src="${context}/resources/assets/js/theme.js"></script>
	
	<!-- Page js -->
<%-- 	<script type="text/javascript" src="${context}/resources/assets/js/member/join.js"></script> --%>
<script type="text/javascript">
function showMsg(tag,msg) {
	$(tag+" small").text(msg);
	$(tag).show()
}

$(function(){
	//이메일 인증 숨김
	$("#auth").hide();
	$("#emailErr").hide();
	$("#pwdErr").hide();
	$("#nameErr").hide();
	
	//이메일 인증번호
	var authNum;
	//이메일 중복 체크 (ajax 구현하기)
	$("#email + button").click(function(){
		var email = $("#email").val();
		if(email ==''){
			showMsg("#emailErr","필수입력 사항입니다.");
		}else{
			var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!reg.test(email)){
				showMsg("#emailErr","이메일 형식이 맞지 않습니다.");
			}else{
				$.ajax({
					type: "post",
					url: "${context}/member/emailCheck.do",
					data: {email: email},
					dataType: 'text',
					success: function(data){
						if(data == 0){ //이메일 존재하지 않음
							$("#auth").show();
							$("#emailErr small").removeClass("text-danger").addClass("text-success");
							showMsg("#emailErr",'메일 주소로 인증 번호가 발송 되었습니다.');
						}else{
							showMsg("#emailErr",'존재하는 이메일 입니다.');
						}
					},
					error: function(jqXHR, exception){
						alert("서버 내부 에러가 발생했습니다.");
						console.log(jqXHR.responseText);
					}
				});
			}
		}
	});
	
	//비밀번호 체크
	$("#pwd").blur(function(){
		var pwd = $(this).val();
		if(pwd ==''){
			showMsg("#pwdErr","필수 입력 사항입니다.");
		}else{
			var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
			if(!reg.test(pwd)){
				showMsg("#pwdErr","비밀번호 형식이 맞지 않습니다.");
			}else{		
				if($("#pwd2").val() != pwd){
					showMsg("#pwdErr","비밀번호 확인이 맞지 않습니다.");
				}else{showMsg("#pwdErr",'');}
			}
		}
	});
	
	//비밀번호 확인
	$("#pwd2").blur(function(){
		var pwd2 = $("#pwd2").val();
		if(pwd2 ==''){
			showMsg("#pwdErr","필수 입력 사항입니다.");
		}else{
			if($("#pwd").val() != pwd2){
				showMsg("#pwdErr","비밀번호 확인이 맞지 않습니다.");
			}else{  $("#pwdErr").hide(); }
		}
	});
	
	//이름 확인
	$("#name + button").click(function(){
		var name = $("#name").val();
		if(name ==''){
			showMsg("#nameErr","필수 입력 사항입니다.");
		}else{
			var reg = /^[가-힣]{2,5}$/;
			if(!reg.test(name)){
				showMsg("#nameErr","정확한 이름을 입력하세요.");
			}else{ $("#nameErr").hide(); }
		}
	});
	
	//휴대폰 확인
	$("#phone").blur(function(){
		var phone = $(this).val();
		if(phone ==''){
			showMsg("#phoneErr","필수 입력 사항입니다.");
		}else{ 
			var reg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
			if(!reg.test(phone)){
				showMsg("#phoneErr","양식에 맞는 휴대폰 번호를 입력하세요");
			}else{ showMsg("#phoneErr").hide(); }
		}
	});
});


function emailAuth() {
	var email = $("#email").val();
	$.ajax({
		type: "post",
		url: "${context}/member/emailAuth",
		data: {email: email},
		success: function(data){
			var msg = JSON.parse(data);
			if(msg.state == 0){
				alert("인증번호 전송에 실패하였습니다.");
			}else{
				alert("인증번호를 전송하였습니다. \n인증번호를 입력해주시기 바랍니다.");
				authNum = msg.authNum;
				$("#auth").show();
			}
		},
		error: function(){
			alert("서버 내부 에러가 발생했습니다.");
		}
	});
}

function authCheck(){
	if(authNum != $("#emailAuthNum").val()){
		alert("인증번호가 다릅니다. 다시 확인해주세요.");
	}else{
		alert("인증 성공");
		$("#auth").hide();
		$("#emailAuthNum").attr("disabled",true);
		$("#email").attr("readonly","readonly");	
	}
}
	
function register(){
	var result = 1;
	var email = $("#email");
	var pwd = $("#pwd");
	var pwd2 = $("#pwd2");
	var name = $("#name");
	var phone = $("#phone");
	var postCode = $("#postCode");
	var detailAddr = $("#detailAddr");
	
	if (email.val() == '') {
		$("#emailErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if (pwd.val() == '') {
		$("#pwdErr").text("필수 입력 사항입니다.");
		result = 0;
	} 
	if (pwd2.val() == '') {
		$("#pwd2Err").text("필수 입력 사항입니다.");
		result = 0;
	}
	if(name.val()==''){
		$("#nameErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if(phone.val()==''){
		$("#phoneErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if(postCode.val()==''||detailAddr.val()==''){
		$("#addrErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	else{
		$("#addrErr").text('');
	}
	if(result==0){
		alert("필수 사항을 기입해주세요.");
		return false;
	}
	if($("#emailErr").text()!=''||$("#pwdErr").text()!=''||$("#pwd2Err").text()!=''
			||$("#nameErr").text()!=''||$("#phoneErr").text()!=''
			||$("#addrErr").text()!=''||$("#emailErr").text()!=''){
		alert("오류 사항을 확인 후 다시 입력해주세요.");
		return false;
	} 
}
</script>
  </body>
</html>