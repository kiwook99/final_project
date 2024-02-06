<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- Daum 우편번호 서비스 스크립트 로드 -->
    <script type="text/javascript" defer>
        $(document).ready(function () {
        	
      
        	// 비밀번호 확인
            $("#pwCheck").click(function () {
                console.log("pwCheck 함수 진입");
                alert("pwCheck 함수 진입");

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

            // ID 중복 확인
            $("#idCheck").on("click", function() {
                var id = $("#memid").val();

                if (id == '' || id.length == 0) {
                    alert("ID를 입력하세요.");
                    return false;
                }

                // Ajax로 전송
                $.ajax({
                    url : './ConfirmId',
                    data : {
                        id : id
                    },
                    type : 'POST',
                    dataType : 'json',
                    success : function(result) {
                        if (result == true) {
                            alert("사용 가능한 ID 입니다.");
                        } else {
                            alert("사용 불가능한 ID 입니다.");
                            $("#memid").val('');
                        }
                    }
                }); // End Ajax
            });
        });
    </script>
</head>
<body>
    <form name="MemInsert" id="MemInsert">
        <table border="1">
            <tr>
                <td colspan="2"><h3>회원가입</h3></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="memid" id="memid" size="20">
                    <input type="button" id="idCheck" value="중복확인">
                    <input type="hidden" id="idDuplication" value="idUncheck">
                </td>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="mempw" id="mempw" size="20"></td>
            </tr>
            <tr>
                <td>비밀번호확인</td>
                <td>
                    <input type="text" name="mempw_r" id="mempw_r" size="20">
                    <input type="button" id="pwCheck" value="비밀번호확인">
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="memname" id="memname" size="20"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="mememail" id="mememail" size="20"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="memphone" id="memphone" size="20"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" id="memaderss" placeholder="우편번호">
                    <input type="button" id="addressBtn" value="우편번호 찾기"><br>
                    <input type="text" id="memraderss" placeholder="도로명주소"><br>
                    <input type="text" id="memdaderss" placeholder="상세주소">
                </td>
            </tr>
            <tr>
                <td colspan="2">                            
                    <input type="button" value="회원가입" id="inBtn">
                    <input type="button" value="취소" id="caBtn">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>