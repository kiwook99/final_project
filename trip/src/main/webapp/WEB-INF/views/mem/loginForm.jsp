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
<style type="text/css">
			#loginbtn, #insertbtn, #searchbtn {
				padding: 10px 20px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
				font-size: 15px;
			}
			
			#loginbtn:hover, #insertbtn:hover, #searchbtn:hover{
					background-color: #0bc5da;
					 transition-duration: 0.5s;
		        }
			
			#sign {
			
				width: 400px;
				height: 250px;
			}
			
</style>
</head>
<body>
<%@ include file="/main.jsp" %>
	<form name="loginForm" id="loginForm">
		<table border = "1" id="sign">
			<tr>
				<td width="50px">ID</td>
				<td><input type="text" name="memid" id="memid" size="35"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="mempw" id="mempw" size="35"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="loginbtn" value="로그인">
					<input type="button" id="insertbtn" value="회원가입">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="searchbtn" value="아이디 /비밀번호찾기">
				</td>
			</tr>
			<tr >
				<td colspan="2">
					  <div id="naver_id_login"></div>
					  <!-- //네이버 로그인 버튼 노출 영역 -->
				</td>
			</tr>
			<tr >
				<td colspan="2">
					<a href="javascript:kakaoLoginApi()">
						<img height="30" width="200" src="/trip/resources/images/kakao.png"/>
					</a>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
				
				
				// 네이버 로그인			
			  	var naver_id_login = new naver_id_login("__6vC6oTd4e9fRwVGDSd", "http://localhost:8088/trip/mem/callback");
			  	var state = naver_id_login.getUniqState();
			  	naver_id_login.setButton("white", 2,40);
			  	naver_id_login.setDomain("http://localhost:8088/trip/");
			  	naver_id_login.setState(state);
			  	//naver_id_login.setPopup();
			  	naver_id_login.init_naver_id_login();

				//카카오 로그인
				function kakaoLoginApi() {
					window.Kakao.init('a9ebba1056f14cfd5ef8692b0b89f172'); // 사용하려는 앱의 JavaScript 키 입력
					window.Kakao.Auth.login({

						success: function(authObj){
						
							// console.log( "authObj >>> : " + JSON.stringify(authObj));					
							window.Kakao.API.request({
								
								url: '/v2/user/me',
								
								success : function(res) {
									console.log( "res  >>> : " + JSON.stringify(res));                   
				                        
			                        let k_id = res.id;	                     
			                        
			                        console.log("k_id >>> : " + k_id);

			                        kakaoLogin(k_id);						
								}
							});				
						}
					});
				}
				
				function kakaoLogin(k_id) {
					alert("kakaoLogin >>> : " + k_id );

					 var memid = k_id;

					 $.ajax({
			            type: "POST", // 또는 "GET"
			            url: "/trip/mem/kakaoLogin", // 컨트롤러의 URL
			            data: "memid=" + memid,
			            success: function(response){
			                // 요청 성공 시 처리할 내용
			                console.log(response);
			                location.href = '<%= request.getContextPath() %>/spot/spot_IsudSelectAll';

			            },
			            error: function(xhr, status, error){
			                // 요청 실패 시 처리할 내용
              			console.error(xhr.responseText);
		           	 	}
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
					
					//회원가입 버튼
					$(document).on("click","#insertbtn",function(){
						location.href = "insertForm"
					});
					
					// 아이디/비밀번호 찾기 버튼
					$(document).on("click","#searchbtn",function(){
						location.href = "idSearchForm"
					});
				});	
	</script>
</body>
</html>