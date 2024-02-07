<!doctype html>
<html lang="ko">
<head>
</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("__6vC6oTd4e9fRwVGDSd", "http://localhost:8088/trip/mem/callback");
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var memid = naver_id_login.getProfileData('nickname');
 	alert(memid);
    // Ajax를 사용하여 서버로 사용자 정보 전송
    $.ajax({
        type: "POST",
        url: "<%= request.getContextPath() %>/mem/naverLogin",
        data: { memid: memid },
        success: function(response){
            console.log(response);
            location.href = '<%= request.getContextPath() %>/spot/spot_IsudSelectAll';
            // 성공 시 페이지 이동 또는 추가 작업 수행
        },
        error: function(xhr, status, error){
            console.error(xhr.responseText);
        }
    });
  }
</script>
</body>
</html>