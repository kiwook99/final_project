<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/style.css">
    <title>회원가입</title>
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
    <form name="MemInsert" id="MemInsert">
    <div class="main-signup">
        <!--웹페이지 상단-->

        <!--회원가입 부분-->
        <section class="signup-wrap">
        <tr>
		<td colspan="2" align="center" style="color:white; background-color:#0aa4b5;">공지사항 수정하기</td>
		</tr>
        <div>
                <!--아이디,비번,비번재확인-->
				<div>
                <h3>아이디</h3>
                <div style="display: flex; align-items: center;">
                <span class="signup-input" style="flex: 1;">
                    <input name="memid" id="memid" type="text"></input>
                </span>
                <span class="cnum-btn-wrap">
            			<button id="idCheck" value="중복확인">중복확인</button>
        			</span>
				</div>
				
                <h3>비밀번호</h3>
				<span class="signup-input">
    				<input name="mempw" id="mempw" type="password"></input>
   					<span class="pw-lock"></span>
				</span>

				<h3>비밀번호 재확인</h3>
				<div style="display: flex; align-items: center;">
                <span class="signup-input" style="flex: 1;">
                    <input name="mempw_r" id="mempw_r" type="text"></input>
                </span>
                <span class="cnum-btn-wrap">
            			<button id="pwCheck" value="중복확인">중복확인</button>
        			</span>
				</div>
                
                <h3>이름</h3>
                <span class="signup-input">
                    <input name="memname" id="memname" type="text"></input>
                    
                </span>

                <h3>이메일</h3>
                <span class="signup-input">
                    <input name="mememail" id="mememail" type="text"></input>
                </span>

                <h3>휴대전화</h3>
                <span class="signup-input">
                    <input name="memphone" id="memphone" type="text"placeholder="특수기호없이"></input>
                </span>
            </div>
       
       		<div style="margin-top: 35px;">
                <h3>주소</h3>
                
                <div style="display: flex; flex-direction: column;">
    				<div style="display: flex; align-items: center;">
        			<span class="signup-input" style="flex: 1;">
            			<input type="text" id="memaderss" placeholder="우편번호">
        			</span>
        			<span class="cnum-btn-wrap">
            			<button id="addressBtn" value="우편번호 찾기">우편번호 찾기</button>
        			</span>
    			</div>
    				<div class="signup-input-c" style="margin-top: 10px;">
        				<input type="text" id="memraderss" placeholder="도로명주소">
    			</div>
    				<div class="signup-input-c" style="margin-top: 10px;">
        				<input type="text" id="memdaderss" placeholder="상세주소를 입력하세요">
    				</div>
				</div>
       
       		<div>
                <!--가입하기-->
                <div class="signup-btn-wrap">
                    <button id="inBtn">가입하기</button>
                    <button id="caBtn">뒤로가기</button>
                </div>
            </div>
        </section>
    </form>
</body>
</html>