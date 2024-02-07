<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .result-container {
        background-color: #f0f0f0;
        padding: 10px;
        border-radius: 5px;
        margin-top: 10px;
    }

    .result-text {
        font-size: 16px;
        color: #333;
        margin: 0;
    }
</style>
</head>
<body>
<div>
	<form name="searchForm" id="searchForm">
		<table border="1">
			<tr>
				<td>ID찾기</td>
				<td>email 입력</td>
				<td><input type="text" name="mememail" id="mememail"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" name="idSearchBtn" id="idSearchBtn" value="ID 찾기">
					<input type="button" name="loginBtn" id="loginBtn" value="로그인 화면으로">
				</td>
			</tr>
		</table>
	</form>
</div>
<div>
	<form action="">
		<table border="1">
			<tr>
				<td>임시 PW 발급</td>
			</tr>
			<tr>
				<td>ID 입력</td>
				<td><input type="text" name="memid" id="memid"></td>
			</tr>
			<tr>
				<td>EMAIL 입력</td>
				<td><input type="text" name="mememail_" id="mememail_"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" name="pwSearchBtn" id="pwSearchBtn" value="PW 찾기">
					<input type="button" name="loginBtn" id="loginBtn" value="로그인 화면으로">
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="idSearch" class="id-container">
	<!-- 찾은 아이디 출력되는 공간 -->
</div>
<div id="pwSearch" class="pw-container">
	<!-- 찾은 아이디 출력되는 공간 -->
</div>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	console.log("자바스크립트 진입 >>> : ");
	
	$(document).ready(function(){
		console.log("jQuery ready() 함수 블럭 진입 >>> : ");
		
		//아이디찾기버튼
		$(document).on("click","#idSearchBtn",function(){

			let idCheckURL = "idSearch";
			let reqType = "POST";
			let dataParam = { mememail: $("#mememail").val(), };

			$.ajax({
				url: idCheckURL,
				type: reqType,
				dataType: "json",
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
            function whenSuccess(resData) {
                console.log("resData >>> : " + resData.result);
                if ("false" === resData.result) {
                    alert("ID가 없습니다");
                } else {
                	var rowHtml =  '<p class="result-text">ID: ' + resData.result + '</p>';
					  			   $("#idSearch").html(rowHtml);
                }
            }

            function whenError(e) {
                alert("e >>> : " + e.responseText);
            }
		});	
		
		//비밀번호찾기버튼
		$(document).on("click","#pwSearchBtn",function(){

			let idCheckURL = "pwSearch";
			let reqType = "POST";
			let dataParam = { mememail: $("#mememail_").val(), memid: $("#memid").val(), };

			$.ajax({
				url: idCheckURL,
				type: reqType,
				dataType: "json",
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
            function whenSuccess(resData) {
                console.log("resData >>> : " + resData);
                	var rowHtml =  '<p class="result-text">:이메일로 임시비밀번호가 발급되었습니다.</p>';
					  			   $("#pwSearch").html(rowHtml);
                }

            function whenError(e) {
            	if (e.responseText !== "success") {
                    // 에러 처리 로직 추가
                    alert("이메일로 임시비밀번호가 발급되었습니다.");
                }
                alert("에러 발생 >>> : " + e.responseText);
            }
		});	
		
		//로그인화면 버튼
		$(document).on("click","#loginBtn",function(){
			location.href = "#"
		});
	});

</script>
</body>
</html>