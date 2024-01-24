<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="loginForm" id="loginForm">
		<table border = "1">
			<tr>
				<td>ID</td>
				<td><input type="text" name="USERID" id="USERID"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="USERPW" id="USERPW"></td>
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
	</form>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script type="text/javascript">
		
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
				});	
			</script>
</body>
</html>