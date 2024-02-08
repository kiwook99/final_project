<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/style.css">
    <title>회원가입</title>
    <style type="text/css">
    	h2 {
    		text-align: center;
    	}
    
        #idCheck:hover, #pwCheck:hover, #inBtn:hover, #caBtn:hover {
        	 background-color: #0bc5da;
			 transition-duration: 0.5s;
        }
        
        button {
           padding: 5px 15px;
           background-color: #0aa4b5;
           color: white;
           border: 0;
		   border-radius: 10px;
           cursor: pointer;
           display: flex; /* 버튼을 블록 요소로 변경 */
       	   float: right; /* 오른쪽으로 이동 */
        }
        
        th {
        text-align: center;
        }
        
        
        #idCheck, #pwCheck {
     		padding: 5px 25px;
			background-color: #0aa4b5;
			color: white;
			border: 0;
			border-radius: 10px;
        }
        
         #inBtn, #caBtn {
     		padding: 10px 30px;
			background-color: #0aa4b5;
			color: white;
			border: 0;
			border-radius: 10px;
        }
        
    </style>
    
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- Daum 우편번호 서비스 스크립트 로드 -->
    <script type="text/javascript" defer>
    $(document).ready(function () {
        // 아이디 중복 체크
        $(document).on("click","#idCheck",function(){
            console.log("idCheck >>> : ");
            event.preventDefault(); 
            let idCheckURL = "idCheck";
            let reqType = "POST";
            let dataParam = { memid: $("#memid").val() };
            
            $.ajax({
                url: idCheckURL,
                type: reqType,
                data: dataParam,
                success: whenSuccess,
                error: whenError
            });
            
            function whenSuccess(resData){
                console.log("resData >>> : " + resData);
                if("ID_YES" == resData){
                    alert("이 아이디는 사용 가능한 아이디 입니다" );
                    
                    $("#memid").css('background-color','yellow');
                    $("#memid").attr("readonly",true);
                    $("#mempw").focus();        
                } else if ("ID_NO" == resData){
                    alert("이 아이디는 사용중인 아이디 입니다");
                    $("#memid").val('');
                    $("#memid").focus();
                }
            }
            
            function whenError(e){
                alert("e >>> : " + e.responseText);
            }
        });
        
        // 비밀번호 확인
        $("#pwCheck").click(function () {
            console.log("pwCheck 함수 진입");
            alert("pwCheck 함수 진입");
            event.preventDefault();
            var pw = $("#mempw").val();
            var pw_r = $("#mempw_r").val();
            if (pw == pw_r) {
                alert("비밀번호가 같습니다.");
                $("#mempw_r").val('mempw_r');
                $("#mempw").css('background-color', 'yellow');
                $("#mempw_r").css('background-color', 'gray');
                $("#mempw").attr("readonly", true);
                $("#mempw_r").attr("readonly", true);
                $("#memname").focus();
                return true;
            } else {
                alert("비밀번호가 다릅니다. 다시 입력 해주세요");
                $("#mempw_r").val('');
                $("#mempw_r").focus();
                return false;
            }
        });

        // 회원가입
        $(document).on("click", "#inBtn", function(){
            console.log("inBtn >>> : ");            
            
         	// 각 필수 입력 항목의 값을 가져옵니다.
            var memid = $("#memid").val();
            var mempw = $("#mempw").val();
            var mempw_r = $("#mempw_r").val();
            var memname = $("#memname").val();
            var mememail = $("#mememail").val();
            
            // 필수 입력 항목이 비어있는지 확인합니다.
            if (memid.trim() === '' || mempw.trim() === '' || mempw_r.trim() === '' || memname.trim() === '' || mememail.trim() === '') {
                alert("필수 항목(*)을 입력하세요.");
                return;
            }

        	 // 아이디 중복 확인이 되었는지 확인합니다.
            if ($("#memid").attr("readonly") !== "readonly") {
                alert("아이디 중복 확인을 해주세요.");
                return;
            }
            
        	 // 비밀번호 확인이 되었는지 확인합니다.
            if ($("#mempw").attr("readonly") !== "readonly") {
                alert("비밀번호 확인을 해주세요.");
                return;
            }
            
            $('#MemInsert').attr({
                'action':'insert',
                'method':'POST',
            }).submit();
        });

        // 취소
        $("#caBtn").on("click", function () {
            window.location.href = "loginForm";
        });

        // 우편번호 찾기
        $("#addressBtn").click(function () {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 사용자가 선택한 주소 정보를 각각의 input에 설정
                    	$("#memaderss").val(data.zonecode);
                        $("#memraderss").val(data.roadAddress);
              
                    }
                }).open();
        });
    });
</script>
</head>
<body>
<%@ include file="/main.jsp" %>

<br>
<hr>
<br>
<h2> 회원가입 </h2>
<br>
<hr>
<br>
	<div class="main-signup">
    	<form name="MemInsert" id="MemInsert">
			<table border="1">
		        <tr>
					<th colspan="2" style="color:white; background-color:#0aa4b5; height: 40px;  text-align:center;">정보입력</th>
				</tr>		
				<tr>
					<th style="height: 40px; width: 160px;">아이디*</th>
					<td>
						<input type="text" name="memid" id="memid" />&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="button" value="중복확인" id="idCheck" />
					</td>
					
				</tr>
				<tr>
					<th style="height: 40px;">비밀번호*</th>
					<td>
						<input type="password" name="mempw" id="mempw" style="margin-right: 107px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<th style="height: 40px;">비밀번호 재확인*</th>
					<td>
						<input type="password" name="mempw_r" id="mempw_r" />&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="button" value="중복확인" id="pwCheck" />
					</td>
				</tr>	
				<tr>
					<th style="height: 40px;">이름*</th>
					<td>
						<input type="text" name="memname" id="memname" style="margin-right: 107px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>	
				<tr>
					<th style="height: 40px;">이메일*</th>
					<td>
						<input type="text" name="mememail" id="mememail" style="margin-right: 107px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>	
				<tr>
					<th style="height: 40px;">휴대전화</th>
					<td>
						<input type="text" name="memphone" id="memphone" "placeholder="특수기호없이" style="margin-right: 107px;"/>&nbsp;&nbsp;&nbsp;&nbsp;

					</td>
				</tr>
				<tr>
					<th rowspan="3" style="height: 160px;">주소</th>
					<td>
						<input type="text" id="memaderss" placeholder="우편번호" style="margin-left: 15px;"/>&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="button" id="addressBtn" value="우편번호 찾기" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="memraderss" placeholder="도로명주소" style="margin-right: 107px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>				
				</tr>	
				<tr>
					<td>
						<input type="text" id="memdaderss" placeholder="상세주소를 입력하세요" style="margin-right: 107px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>				
				</tr>
				<tr>
					<td colspan="2" style="height: 60px;">
						<input type="button" value="가입하기" id="inBtn" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="뒤로가기" id="caBtn" />
					</td>
				</tr>										 	
			</table>
    	</form>
    </div>
    <br><br><br>
</body>
</html>