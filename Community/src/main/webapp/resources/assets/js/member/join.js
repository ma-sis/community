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
		var email = $(this).val();
		if(email ==''){
			showMsg("#emailErr","필수입력 사항입니다.");
		}else{
			var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!reg.test(email)){
				showMsg("#emailErr","이메일 형식이 맞지 않습니다.");
			}else{
				$.ajax({
					type: "post",
					url: "${contextPath}/member/emailCheck.do",
					data: {email: email},
					dataType: 'text',
					success: function(data){
						if(data == 0){ //이메일 존재하지 않음
							$("#emailErr").hide();
							$("#auth").show();
						}else{
							showMsg("#emailErr",'존재하는 이메일 입니다.');
						}
					},
					error: function(jqXHR, exception){
						alert("서버 내부 에러가 발생했습니다.");
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
	$("#name").blur(function(){
		var name = $(this).val();
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
	if(email==''){
		alert("이메일을 입력해주세요.");
	}else{
		if($("#emailErr").text()!=''){
			alert("오류사항을 확인 후 다시 입력해주세요.");
		}else{
			$("#postAuth").attr("value","재전송");
			$.ajax({
				type: "post",
				async: false,
				url: "${contextPath}/me/emailAuth",
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
	}
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