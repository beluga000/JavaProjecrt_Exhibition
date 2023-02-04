<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<link href="../member/css/join.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	Shadowbox.init({
		players : [ 'iframe' ]
	})
	$(function() {

		// 우편번호 검색
		$('#post').click(function() {
			Shadowbox.open({
				content : '../member/postfind.do',
				player : 'iframe',
				width : 600,
				height : 400,
			})
		})

		// 이메일 확인
		$('#eBtn').click(function() {
			let email = $('#email').val();
			if (email.trim() === "") {
				$('#email').focus();
				return;
			}
			
			let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(email)) {
	        	$('#ePrint').html("<font color=red>이메일 형식이 올바르지 않습니다!</font>");
	            $('#email').val("");
	            $('#email').focus();
	            return
	        }

			$.ajax({
				type : 'post',
				url : '../member/email_check.do',
				data : {
					"email" : email
				},
				success : function(result) {
					let count = Number(result.trim());
					if (count == 0) {
						$('#ePrint').html("<font color=green>" + email + "는(은) 사용 가능한 이메일입니다</font>");
						$('#email').prop('readonly', true);
					} else {
						$('#ePrint').html("<font color=red>" + email + "는(은) 이미 사용중인 이메일입니다</font>");
						$('#email').val("");
						$('#email').focus();
					}
				}
			})
		})
		// 전화번호 검색	
		$('#tBtn').click(function() {
			let phone = $('#tel').val();
			if (phone.trim() === "") {
				$('#tel').focus();
				return;
			}
			let phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if (!phoneRegExp.test(phone.trim())) {
				$('#tPrint').html("<font color=red>휴대폰 번호 형식이 올바르지 않습니다!<br>ex)010-XXXX-XXXX</font>");
	        	return
	        }

			$.ajax({
				type : 'post',
				url : '../member/tel_check.do',
				data : {
					"phone" : phone
				},
				success : function(result) {
					let count = Number(result.trim());
					if (count == 0) {
						$('#tPrint').html("<font color=green>" + phone + "는(은) 사용 가능한 번호입니다</font>");
						$('#tel').prop('readonly', true);
					} else {
						$('#tPrint').html("<font color=red>" + phone + "는(은) 이미 사용중인 번호입니다</font>");
						$('#tel').val("");
						$('#tel').focus();
					}
				}
			})
		})
		

		$('#joinBtn').click(function() {
			
			let pwd = $('#join_pwd').val();
			if (pwd.trim() === "") {
				$('#id_result').html("");
				$('#pwd_result').html("<font color=red>비밀번호를 입력해주세요</font>");
				$('#join_pwd').focus();
				return;
			}
			
			let pwdRegExp = /^[a-zA-z0-9]{4,8}$/;
			if (!pwdRegExp.test(pwd.trim())) {
				$('#id_result').html("");
	            $('#pwd_result').html("<font color=red>비밀번호는 영문 대소문자와 숫자 4~8자리로 입력해야합니다!</font>");
	        	return
	        }
			
			let name = $('#name').val();
			if (name.trim() === "") {
				$('#pwd_result').html("");
				$('#pwd1_result').html("");
	        	$('#name_result').html("<font color=red>이름을 입력해주세요.</font>");
				$('#name').focus();
				return;
			}
			
			let nameRegExp = /^[가-힣]{2,4}$/;
	        if (!nameRegExp.test(name)) {
	        	$('#name_result').html("<font color=red>이름이 올바르지 않습니다.</font>");
				$('#name').val("");
				$('#name').focus();
	            return;
	        }

			let year = $('#year').val();
	        if (year.trim() == "") {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 입력해주세요.</font>");
				$('#year').focus();
	            return;
	        }
			let yearRegExp = /^(19|20)[0-9]{2}$/;
	        if (!yearRegExp.test(year)) {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 올바르게 입력해주세요.</font>");
				$('#year').val("");
				$('#year').focus();
	            return;
	        }
			let month = $('#month').val();
	        if (month.trim() == "") {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 입력해주세요.</font>");
				$('#month').focus();
	            return;
	        }
	        
			let monthRegExp = /^(0[1-9]|1[0-2])$/;
	        if (!monthRegExp.test(month)) {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 올바르게 입력해주세요.</font>");
				$('#month').val("");
				$('#month').focus();
	            return;
	        }
	        
			let day = $('#day').val();
	        if (day.trim() == "") {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 입력해주세요.</font>");
				$('#day').focus();
	            return;
	        }
			let dayRegExp = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
	        if (!dayRegExp.test(day)) {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 올바르게 입력해주세요.</font>");
				$('#day').val("");
				$('#day').focus();
	            return;
	        }
			
			let email = $('#email').val();
			if (email.trim() === "") {
				$('#birthday_result').html("");
				$('#ePrint').html("<font color=red>이메일을 입력해주세요.</font>");
				$('#email').focus();
				return;
			}
			
			let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(email)) {
	        	$('#ePrint').html("<font color=red>이메일 형식이 올바르지 않습니다!</font>");
	            $('#email').val("");
	            $('#email').focus();
	            return
	        }

			let post = $('#post').val();
			if (post.trim() === "") {
				$('#ePrint').html("")
				$('#post_result').html("<font color=red>우편번호를 입력해주세요.</font>");
				$('#post').focus();
				return;
			}

			let addr1 = $('#addr1').val();
			if (addr1.trim() === "") {
				alert("주소를 입력해주세요.")
				$('#addr1').focus();
				return;
			}

			let tel = $('#tel').val();
			if (tel.trim() === "") {
				$('#post_result').html("");
				$('#tPrint').html("<font color=red>전화번호를 입력해주세요.</font>");
				$('#tel').focus();
				return;
			}
			
			let telRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if (!telRegExp.test(tel.trim())) {
				$('#tPrint').html("<font color=red>휴대폰 번호 형식이 올바르지 않습니다!<br>ex)010-XXXX-XXXX</font>");
				$('#tel').val("");
				$('#tel').focus();
	        	return
	        }
			
			let formData=$('#join_frm').serialize()
		   	  $.ajax({
		   		  type:'post',
		   		  url:'../member/join_update_ok.do',
		   		  data:formData,
		   		  success:function(response) {
		   			  let res = response.trim();
		   			  if(res === 'no') { // 비밀번호가 틀린 경우
		   				  alert("비밀번호가 틀립니다");
		   			  	  $('#join_pwd').val("");
		   			  	  $('#join_pwd').focus();
		   			  } else { // 비밀번호가 맞는 경우
		   				  alert("회원 수정이 완료되었습니다")
		   			  	  location.href="../main/main.do";
		   			  }
		   		  }
		   	  })
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="top">
			<h1>GOD</h1>
		</div>

		<form method="post" action="../member/join_ok.do" name="join_frm"
			id="join_frm">
			<div class="info_member">
				<div>
					<p>아이디</p>
					<div>
						<input type="text" name="id" id="join_id"
							placeholder="중복확인 버튼을 눌러주세요" readonly value="${vo.id}">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span id="id_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
					<p>비밀번호</p>
					<input type="password" name="pwd" id="join_pwd"
						placeholder="비밀번호를 입력해주세요">
					<div style="text-align: left; padding-left: 5px">
					<span id="pwd_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
				</div>
				<div>
					<p>이름</p>
					<input type="text" name="name" id="name" placeholder="이름을 입력해주세요" value="${vo.name }">
					<div style="text-align: left; padding-left: 5px">
					<span id="name_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div style="text-align: left">
					<p>생년월일</p>
					<div>
						<input type="text" size="4" maxlength="4" placeholder="YYYY"
							name="year" id="year" value="${year }"> <span>/</span> <input type="text"
							size="2" maxlength="2" placeholder="MM" name="month" id="month" value="${month }">
						<span>/</span> <input type="text" size="2" maxlength="2"
							placeholder="DD" name="day" id="day" value="${day }">
					</div>
					<span id="birthday_result" style="font-size: 12px;"></span>
				</div>
				<div>
					<p>성별</p>
					<div>
						<lable for="smallradio"> <input type="radio" name="sex"
							value="남자" class="smallradio" ${vo.sex=='남자'?"checked":""}>남자 </lable>
						<lable for="smallradio"> <input type="radio" name="sex"
							value="여자" class="smallradio" ${vo.sex=='여자'?"checked":""}>여자 </lable>
					</div>
				</div>
				<div>
					<p>이메일</p>
					<div style="display: flex">
						<input type="text" name="email" value="${vo.email }" id=email
							placeholder="예) gooutdisplay@naver.com"> <input
							type="button" id="eBtn" value="이메일확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span id="ePrint" style="font-size: 12px;"></span>
					</div>
					</td>
				</div>
				<div>
					<p>우편번호</p>
					<input type="text" name="post" id="post" value="${vo.post }" placeholder="">
					<div style="text-align: left; padding-left: 5px">
						<span id="post_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
					<p>주소</p>
					<input type="text" name="addr1" id="addr1" value="${vo.addr1 }" placeholder="">
				</div>
				<div>
					<p>상세주소</p>
					<input type="text" name="addr2" id="addr2" value="${vo.addr2 }" placeholder="">
				</div>
				<div>
					<p>휴대전화</p>
					<div>
						<input type="text" name="tel" id="tel" value="${vo.phone}"
							placeholder="예) 010-1234-1234"> <input type="button" id="tBtn"
							value="전화확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span id="tPrint" style="font-size: 12px;"></span>
					</div>
					</td>
				</div>
				<div style="padding-bottom: 40px">
					<input type="button" id="joinBtn" value="수정하기">
				</div>
				
				<p style="font-size: 14px;" id="last">
				이용약관 | 개인정보처리방침 | 책임의 한계와 법적고지 | 회원정보 | 고객센터<br>
				<span style="font-size: 12px;">GOD Copyright <b>GOD Corp</b>. All Rights Reserved.</span>
				</p>
			</div>
		</form>
	</div>


</body>
</html>