function showMsg(tag,msg) {
	$(tag+" small").html(msg);
	$(tag).show()
}

$(function(){
	//이메일 인증 숨김
	$("#auth").hide();
	$("#authErr").hide();
	$("#emailErr").hide();
	$("#nameErr").hide();
	$("#phoneErr").hide();

	//이메일 인증번호
	var authNum;
	//이메일 중복 체크 (ajax 구현하기)
	$("#email + button").click(function(){
		$("#emailErr small").removeClass("text-success").addClass("text-danger");
		var email = $("#email").val();
		if(email ==''){
			showMsg("#emailErr","필수입력 사항입니다.");
		}else{
			var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!reg.test(email)){
				showMsg("#emailErr","이메일 형식이 맞지 않습니다.");
			}else{
				showMsg("#emailErr",'메일 보내는 중...<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="sr-only">Loading...</span></div>');
				$.ajax({
					type: "post",
					url: "../member/emailCheck.do",
					data: {email: email},
					dataType: 'text',
					success: function(data){
						if(data == 0){ //이메일 존재하지 않음
							$("#auth").show();
							$("#emailErr small").removeClass("text-danger").addClass("text-success");
							showMsg("#emailErr",'메일 주소로 인증 번호가 발송 되었습니다.');
							authNum = data;
							$("#email").attr("readonly","readonly");
// 							alert(authNum);
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
	});//end of email check
	
	$("#emailAuthNum + button").click(function() {
		var emailAuth = $("#emailAuthNum").val();
		$.ajax({
			type: "post",
			url: "../member/emailAuthCheck.do",
			data: {emailAuth: emailAuth},
			dataType: 'text',
			success: function(data){
				if(data == 0){ //인증번호 일치
					showMsg("#emailErr","인증 성공");
					$("#auth").hide();
					$("#emailAuthNum").attr("disabled",true);	
				}else{
					$("#authErr").show();
				}
			},
			error: function(jqXHR, exception){
				alert("서버 내부 에러가 발생했습니다.");
				console.log(jqXHR.responseText);
			}
		});
	});//end of emailAuth check
	
	//이름 확인
	$("#name + button").click(function(){
		var name = $("#name").val().trim( );
		if(name ==''){
			showMsg("#nameErr","필수 입력 사항입니다.");
		}else if(name.length < 3){
			showMsg("#nameErr","3자리 이상 작성해 주세요.");
		}else{
			$.ajax({
				type: "post",
				url: "../member/nameCheck.do",
				data: {name: name},
				dataType: 'text',
				success: function(data){
					if(data == 0){ //닉네임 사용가능
						var namecon = confirm(name+"을/를 이름으로 사용하시겠습니까?");
						if(namecon){
							$("#name").attr("readonly","readonly");
							$("#nameErr small").removeClass("text-danger").addClass("text-success");
							showMsg("#nameErr","중복체크 완료");
							console.log($("#name").attr("readonly"));
						}
					}else{
						showMsg("#nameErr",'중복된 이름입니다.');
					}
				},
				error: function(jqXHR, exception){
					alert("서버 내부 에러가 발생했습니다.");
					console.log(jqXHR.responseText);
				}
			});
		}
	});//end of name check
	
	//비밀번호 체크
	$("#pwd").blur(function(){
		var pwd = $(this).val();
		if(pwd ==''){
			showMsg("#pwdErr","영문/숫자/특수문자 혼합하여 8자이상 20글자 이하");
		}else{
			var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
			if(!reg.test(pwd)){
				showMsg("#pwdErr","영문/숫자/특수문자 혼합하여 8자이상 20글자 이하");
			}else{		
				if($("#pwd2").val() != pwd){
					showMsg("#pwdErr","비밀번호 확인이 맞지 않습니다.");
				}else{showMsg("#pwdErr",'');}
			}
		}
	});//end of pwd check
	
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
	});//end of pwd re-check
	
	//휴대폰 확인
	$("#phone").keyup(function(){
		var phone = $("#phone").val();
		$("#phone").val(autoHypenPhone(phone));
	});//end of phone check
	
	$('form').submit(function() {
		var result = 1;
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var phone = $("#phone").val();
	
		var emailCheck = $("#email").attr("readonly");
		var nameCheck = $("#name").attr("readonly");
		
		//이메일 최종 확인
		if (emailCheck != 'readonly') {
			showMsg("#emailErr","필수 입력 사항입니다.");
			result = 0;
		}
		
		//이름 최종 확인
		if (nameCheck != 'readonly') {
			showMsg("#nameErr","필수 입력 사항입니다.");
			result = 0;
		}
		
		//비밀번호 확인
		var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
		if (pwd == '') {
			showMsg("#pwdErr","필수 입력 사항입니다.");
			result = 0;
		}else if(!pwdReg.test(pwd)){
			showMsg("#pwdErr","비밀번호 양식이 맞지 않습니다.");
			result=0;
		}else if(pwd != pwd2){
			showMsg("#pwdErr","비밀번호 확인이 맞지 않습니다.");
			result=0;
		}

		//폰 번호 확인
		var phoneReg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
		if(!phoneReg.test(phone)){
			$("#phoneErr").show();
			result=0;
		}

		if (result == 0) {
			alert("필수 사항을 기입해주세요.");
			return false;
		}else alert("회원가입을 축하합니다! 로그인 페이지로 이동합니다.");
		
	});//end of on submit
});


	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}