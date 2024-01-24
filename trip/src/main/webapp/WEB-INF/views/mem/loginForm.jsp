<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
  integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
<script> Kakao.init('a9ebba1056f14cfd5ef8692b0b89f172'); // 사용하려는 앱의 JavaScript 키 입력 </script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form name="loginForm" id="loginForm">
		<table border = "1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="memid" id=""memid""></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="mempw" id="mempw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" id="loginbtn" value="로그인">
					<input type="button" id="insertbtn" value="회원가입">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="idbtn" value="아이디 찾기">
					<input type="button" id="pwbtn" value="비밀번호 찾기">
				</td>
			</tr>
		</table>
		<table border = "1">
			<tr>
				<td>
					<input type="button" id="kakaobtn" value="카카오로그인">
				</td>
			</tr>
		</table>
	</form>

			<script type="text/javascript">
				function loginWithKakao() {
				   Kakao.Auth.authorize({
				     redirectUri: 'http://localhost:8088',
				     prompt: 'login',
					});
				}

				$(document).ready(function(){
					console.log("document.ready >>> : ");
					
					$(document).on("click", "#loginbtn", function(){
						
						console.log("loginbtn >>> : ");			
						
						$('#loginForm').attr({
							'action':'login',
							'method':'POST',
						}).submit();
					});
					
					$(document).on("click","#insertbtn",function(){
						location.href = "#"
					});
					
					$(document).on("click","#idbtn",function(){
						location.href = "#"
					});
					
					$(document).on("click","#pwbtn",function(){
						location.href = "#"
					});
					
					$(document).on("click","#kakaobtn",function(){
						Kakao.Auth.authorize();
					});
					
				});	
			</script>
</body>
</html>