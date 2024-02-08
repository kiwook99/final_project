<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
    .form-container {
        margin: 10px;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: white;
        max-width: 800px; /* 최대 너비 설정 */
        margin: 0 auto; /* 가운데 정렬 */
    }

    .form-container table {
        width: 100%;
        border-collapse: collapse;
    }

    .form-container table, .form-container table td {
        border: 1px solid #ddd;
    }

    .form-container td {
        padding: 10px;
        text-align: center;
        color: white;
    }

    .form-container input[type="text"] {
        width: 100%;
        padding: 5px;
        margin: 5px 0;
        box-sizing: border-box;
    }

    .form-container input[type="button"] {
        padding: 10px 20px;
        background-color: #0aa4b5;
        color: white;
        border: 0;
        border-radius: 10px;
        font-size: 15px;
        cursor: pointer;
    }

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
<%@ include file="/main.jsp" %>

<div class="form-container">
	<form name="searchForm" id="searchForm">
		<table border="1">
			<tr style="background-color: #0aa4b5;">
				<td colspan="2" align="center">ID 찾기</td>
			</tr>
			<tr>
				<td style="background-color: #0aa4b5;">EMAIL 입력</td>
				<td><input type="text" name="mememail" id="mememail"></td>
			</tr>
			<tr>
				<td colspan="2" id="idSearch" class="id-container">
					<!-- 찾은 아이디 출력되는 공간 -->
				</td>			 
			</tr>			
			<tr>
				<td colspan="2">
					<input type="button" name="idSearchBtn" id="idSearchBtn" value="ID 찾기">
					<input type="button" name="loginBBtn" id="loginBBtn" value="로그인 화면으로">
				</td>
			</tr>
		</table>
	</form>
</div>
<br>
<br>
<br>
<br>
<div class="form-container">
	<form action="">
		<table border="1">
			<tr style="background-color: #0aa4b5;">
				<td colspan="2" align="center">임시 PW 발급</td>
			</tr>
			<tr>
				<td style="background-color: #0aa4b5;">ID 입력</td>
				<td><input type="text" name="memid" id="memid"></td>
			</tr>
			<tr>
				<td style="background-color: #0aa4b5;">EMAIL 입력</td>
				<td><input type="text" name="mememail_" id="mememail_"></td>
			</tr>
			<tr>
				<td colspan="2" id="pwSearch" class="pw-container">
						<!-- 찾은 아이디 출력되는 공간 -->
				</td>			 
			</tr>			
			<tr>
				<td colspan="2">
					<input type="button" name="pwSearchBtn" id="pwSearchBtn" value="PW 찾기">
					<input type="button" name="loginBBtn" id="loginBBtn" value="로그인 화면으로">
				</td>
			</tr>
		</table>
	</form>
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
	        let dataParam = { mememail: $("#mememail").val() };

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
	            if (undefined == resData.result) {
	                alert("ID가 없습니다");
	            } else {
	                var rowHtml =  '<p style="color: black;">ID는  <strong class="result-text" style="color:red;">' + resData.result + '</strong>' + ' 입니다.</p>';
	                $("#idSearch").html(rowHtml);
	            }
	        }

	        function whenError(e) {
	            alert("e >>> : " + e.responseText);
	        }
	    }); 
	    
        // 비밀번호찾기버튼
        $(document).on("click","#pwSearchBtn",function(){

            let idCheckURL = "pwSearch";
            let reqType = "POST";
            let dataParam = { mememail: $("#mememail_").val(), memid: $("#memid").val() };

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
                    
					alert("ID와 이메일을 입력해 주세요");   	            
                }
               
               
                function whenError(e) {
                    if (e.responseText !== "success") {
                        // 에러 처리 로직 추가
                    	alert("오류 발생!");
                    }
                    alert("결과 >>> : " + e.responseText);
                    var rowHtml =  '<strong class="result-text" style="color: black;">이메일로 임시비밀번호가 발급되었습니다.</strong>';
                    $("#pwSearch").html(rowHtml);
                }
        }); 
	    
        
   /*     
	    //비밀번호찾기버튼
	    $(document).on("click","#pwSearchBtn",function(){

	        let idCheckURL = "pwSearch";
	        let reqType = "POST";
	        let dataParam = { mememail: $("#mememail_").val(), memid: $("#memid").val() };

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
	            var rowHtml =  '<strong class="result-text" style="color: black;">이메일로 임시비밀번호가 발급되었습니다.</strong>';
	            $("#pwSearch").html(rowHtml);
	        }    
	        
	        function whenError(e) {
	            if (e.responseText !== "success") {
	                // 에러 처리 로직 추가
	                alert("이메일로 임시비밀번호가 발급되었습니다.");
	            }
	            alert("에러 발생 >>> : " + e.responseText);
	        }	        
         
       */ 
        
	    //로그인화면 버튼
	    $(document).on("click","#loginBBtn",function(){
	        location.href = "loginForm";
	    });
	});

</script>
</body>
</html>