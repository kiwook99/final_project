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
                $("#mempw_r").val('');
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
            $('#MemInsert').attr({
                'action':'insert',
                'method':'POST',
            }).submit();
        });

        // 취소
        $("#caBtn").on("click", function () {
            window.location.href = "index.jsp";
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
					<td colspan="4" align="center" style="color:white; background-color:#0aa4b5; height: 40px;">공지사항 수정하기</td>
				</tr>		
				<tr>
					<th style="height: 40px;">아이디<th>
					<td>
						<input type="text" name=memid" id=memid" />
					</td>
					<td>
						<input type="button" value="중복확인" id="idCheck" />
					</td>
					
				</tr>
				<tr>
					<th style="height: 40px;">비밀번호</th>
					<td colspan="2">
						<input type="password" name=mempw" id=mempw" />
					</td>
				</tr>
				<tr>
					<th style="height: 40px;">비밀번호 재확인</th>
					<td colspan="2">
						<input type="password" name=mempw_r" id="mempw_r" />
					</td>
					<td>
						<input type="button" value="중복확인" id="pwCheck" />
					</td>
				</tr>	
				<tr>
					<th style="height: 40px;">이름</th>
					<td colspan="2">
						<input type="text" name="memname" id="memname" />
					</td>
				</tr>	
				<tr>
					<th style="height: 40px;">이메일</th>
					<td colspan="2">
						<input type="text" name="mememail" id="mememail" />
					</td>
				</tr>	
				<tr>
					<th style="height: 40px;">휴대전화</th>
					<td colspan="2">
						<input type="text" name="memphone" id="memphone" "placeholder="특수기호없이" />
					</td>
				</tr>
				<tr>
					<th rowspan="3" style="height: 160px;">주소</th>
					<td colspan="2">
						<input type="text" id="memaderss" placeholder="우편번호" />
					</td>
					<td>
						<input type="button" id="addressBtn" value="우편번호 찾기" />
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="text" id="memraderss" placeholder="도로명주소" />
					</td>				
				</tr>	
				<tr>
					<th></th>
					<td>
						<input type="text" id="memdaderss" placeholder="상세주소를 입력하세요" />
					</td>				
				</tr>
				<tr>
					<td colspan="4" style="height: 60px;">
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