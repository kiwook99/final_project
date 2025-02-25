<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>  
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
				<td><input type="text" name="memid" id="memid"></td>
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
					<a href="javascript:kakaoLoginApi()">
					<img height="30" width="208" src="resources/images/kakao.png"/></a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="#">
					<img height="30" width="208" src="resources/images/naver.png"/></a>
				</td>
			</tr>
		</table>
	</form>
	<!-- 카카오 로그인 api  -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
				//카카오 로그인 ===================================================================================
				window.Kakao.init('a9ebba1056f14cfd5ef8692b0b89f172'); // 사용하려는 앱의 JavaScript 키 입력
				
				function kakaoLoginApi() {
					alert("kakaoLoginApi >>> : ");
					
					window.Kakao.Auth.login({

						success: function(authObj){
						
							// console.log( "authObj >>> : " + JSON.stringify(authObj));					
							window.Kakao.API.request({
								
								url: '/v2/user/me',
								
								success : function(res) {
									console.log( "res  >>> : " + JSON.stringify(res));                   
				                        
			                        let k_id = res.id;
			                        // let k_email = res.kakao_account.email;
			                        //let k_gender = res.kakao_account.gender;
			                        //let k_nickname = res.properties.nickname;
			                        // let k_profile_image = res.properties.profile_image;
			                        // let k_thumbnail_image = res.properties.thumbnail_image;
			                        
			                        console.log("k_id >>> : " + k_id);
			                        //console.log("k_gender >>> : " + k_gender);
			                        //console.log("k_nickname >>> : " + k_nickname);
			                        //console.log("k_profile_image >>> : " + k_profile_image);
			                        // console.log("k_thumbnail_image >>> : " + k_thumbnail_image);
			                        
			                        kakaoLogin(k_id);						
								}
							});				
						}
					});
				}
				
				function kakaoLogin(k_id) {
					alert("kakaoLogin >>> : " + k_id );
					
					// Ajax 호출해서 로직 만들기 대신 자바스크립트 location 이용해보기  
					// 학생들은 코딩할 때는 Ajax 로 하기 
					location.href="kakaoLogin";
				}
				//카카오 로그인 ===================================================================================

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