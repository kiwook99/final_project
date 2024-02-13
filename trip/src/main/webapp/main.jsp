<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="take.a.trip.T_Session" %>

<%
//T_Session 객체 생성
T_Session tSession = T_Session.getInstance();

//HttpServletRequest 객체를 사용하여 세션 가져오기
HttpServletRequest httpServletRequest = (HttpServletRequest) pageContext.getRequest();
String memid = tSession.getSession(httpServletRequest);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<!-- CDN css only -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->
<!-- CDN js bundle with popper -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->

<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}
</style>
		<!-- 스타일 -->
		<style type="text/css">
			
			.material-symbols-outlined {
				font-size: 65px;
			}
			
			table {
				text-align: center;	
				margin: 0 auto;
			}
			
			
			.list_content ul {
				display: flex; 		/* flex : 수평으로 나열*/
				flex-wrap: wrap;	/* 화면 크기에 따라 자동 줄바꿈 */
				justify-content: center; /* 가로 방향으로 가운데 정렬  ( 가로축 - 중심축 )*/
				
			}
			
			.logo ul, .logo li {
				list-style: none;	/* 목록 스타일 제거*/
			}
			
			* {
				margin: 0;		/* 여백 제거*/
				padding: 0;		/* 패딩 제거*/
			}


			.img {
				display: block;	/* 한 줄 모두 차지*/
			}
			
			.list_content ul li .img {	/* 이미지 감싸는 요소 (span)*/
			    height: 250px;
			    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
			}		
			
			.list_content ul li .img img{
    			border-radius: 10px;	/* 외곽선 둥글게*/
			}	
						
			.list_content ul li {	/* 관광지 목록의 각 항목*/
			    width: 380px;
			    margin: 0 20px 40px 0;
			    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
			}
			
			
			.logo a:link,
			.logo a:visited,
			.logo a:focus,
			.logo a:active {
			    /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
			    text-decoration: none;
			    color: black;
			}
			

			
			.img img {
				width: 100%; /* width, height 부모 요소에 대해 이미지가 가득 차도록 함*/
				height: 100%; 
				object-fit: cover; /*  이미지가 자동으로 크기 조정되어 부모 요소에 가득 차도록 설정, 이미지는 종횡비를 유지하고 주어진 크기를 채움, 이미지가 맞게 잘림 */
				object-position: 50% 50%;	/* 이미지 중앙 정렬*/
			}
			
			img {
			    border: 0 none;	/* 외곽선 제거, 두께 0, 유형 없음*/
			}			
		


						
			/*카테고리*/
			.menu {
			  width: 100%;
			  overflow: hidden;
			  margin: 0 auto;
			  margin-left: 5px;
			  font-size: 25px;
			}
			
			.menu > li {
			  width: 33%;
			  text-align: center;
			  line-height: 40px;
			  background-color: #0aa4b5;
		      vertical-align: text-top;
			} 

			 
			.sb > li {
			  line-height: 50px;
			  background-color: #0bc5da;
			}	
			
			.sb {
 			  height: 0; /*ul의 높이를 안보이게 처리*/ 
			  overflow: hidden; 

			}					 
			 
			.menu > li:hover {
			  background-color: #0bc5da;
			  transition-duration: 0.5s;
			}	
			
			.menu > li:hover .sb {
			  	height: 100px; /*서브메뉴 li한개의 높이 50*5*/
			  	transition-duration: 1s;
			  						 
			}	
					 
			.menu a {
			  color: #fff;
			}				 
					 
			.logo a:link,
			.logo a:visited,
			.logo a:focus,
			.logo a:active {
			    /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
			    text-decoration: none;
			    color: black;
			}

			.topnav	 a:link,
			.topnav a:visited,
			.topnav a:focus,
			.topnav a:active {
			    /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
			    text-decoration: none;
			    
			}
		
			#loginBtn, #logoutBtn {
				padding: 10px 20px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
				font-size: 15px;
/* 				font-size: 20px; */
				margin-top: -55px; 
				float: right;
/* 				font-family: 'East Sea Dokdo', sans-serif; */
			}
			
			.loginBtn p {
				font-size: 30px;
			    margin-right: 125px;
   				margin-top: -90px;
			}
			
			.logo {
			    text-align: center;
			    margin-top: 30px;
			    font-size: 28px;
			    margin-left: 710px;
    			width: 440px;
			}
			
			.loginBtn {
			    text-align: right;
			    margin-right: 80px;
		        margin-top: 20px;
			}

		
			a {
			    text-align: center;
			    color: black;
			}
				
			 h1 {
			 	text-align: center;
			 }
			 
			 .weatherIcon{
			 margin-left: 20px;
		     float: left;
		     height: 40px;
		     margin-top: -156px;
		     font-family: 'East Sea Dokdo', sans-serif;
			 }
			 
			 #header{
			 height: 103px;
			 }

			 .weatherIcon a {
			 	text-decoration: none;
			 }

			 body {
			 	background-color: #F7FCFC;
			 }	
			 
			 #logoutBtn:hover, #loginBtn:hover {
			     background-color: #0bc5da;
				 transition-duration: 0.5s;
			 }

			#header {
				font-family: 'East Sea Dokdo', sans-serif;
			}


			.main_logo {
			  font-family: 'East Sea Dokdo', sans-serif;
			  font-size: 85px;
			}



			
			.menuLink {
		        display: block;
		        text-decoration: none;
		        padding: 8px;
	        	position: relative;
		    }
		
		    .topMenuLi {
		        display: inline-block;
		        position: relative;
				font-family: 'East Sea Dokdo', sans-serif;
		    }
		

		    .topMenuLi:hover .sb {
		        display: block;
		    }
		    
		    .sb {
		     	display: table-column;
		        position: relative;
			    top: 100%; /* Adjust this value as needed to control the vertical spacing */
			    left: 0;
			    background-color: #fff; /* Optional: Background color for the submenu */
			    border: 1px solid #ccc; /* Optional: Border for the submenu */
			    text-align-last: center;
			}

			.loginBtn p, .loginBtn input {
			  display: inline-block;
			  vertical-align: middle;
			}
		

		</style>

		
</head>
<body>
	<br>
		<div id="header">
		    <div class="logo">
		        <a href="<%= request.getContextPath() %>/spot/spot_IsudSelectAll" class="main_logo">
					<span class="material-symbols-outlined">travel</span> 여행하기 좋은날
				
		        </a>		        

		    </div>
		    <div id="weatherIcon" class="weatherIcon">
                   <a href="https://www.weather.go.kr/w/index.do#dong/2811058500/37.47405/126.63111/%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C%20%EC%A4%91%EA%B5%AC%20%EB%8F%99%EC%9D%B8%EC%B2%9C%EB%8F%99//">
                       <h3 id="a" class="a"></h3>
                   </a>
		    </div>

 			<div class="loginBtn">
			    		
			        <% if(memid != null) { %> 
			            <!-- 조건이 참일 때 보이는 태그 -->
			            <p><%= memid %> 님</p>
			            <input type="button" name="login" id="logoutBtn" value="로그아웃" onclick="location.href='/trip/mem/logout'">
       			   <% } else { %> 
			        
			            <!-- 조건이 거짓일 때 보이는 태그임 -->
			            <input type="button" name="login" id="loginBtn" value="로그인" onclick="location.href='/trip/mem/loginForm'">
			        <% } %> 
			    
			</div>
		</div>
		<br>
		 
 			<div class="topnav">
		
			    <!-- 메뉴 -->
			    <ul class="menu">
			        <li class="topMenuLi">
			            <a class="menuLink" href="<%= request.getContextPath() %>/spot/spot">관광지</a>
			            <ul class="sb">
			                <li><a href="<%= request.getContextPath() %>/spot/spot" class="submenuLink">관광 정보</a></li>
			                <li><a href="<%= request.getContextPath() %>/spot/spot_IsudSelectAll" class="submenuLink">관광 정보(ISUD)</a></li>
			            </ul>
			        </li>
			
			        <li class="topMenuLi">
			            <a class="menuLink" href="<%= request.getContextPath() %>/hotel/hotel_main">숙소</a>
			            <ul class="sb">
			                <li><a href="<%= request.getContextPath() %>/hotel/hotel_main" class="submenuLink">숙소 정보</a></li>
			                <li><a href="<%= request.getContextPath() %>/hotel/hotelReview" class="submenuLink">숙소 리뷰</a></li>
			            </ul>
			        </li>
			
			        <li class="topMenuLi">
			            <a class="menuLink" href="#content3">게시판</a>
			            <ul class="sb">
			                <li><a href="<%= request.getContextPath() %>/board/boardSelectAll" class="submenuLink">자유 게시판</a></li>
			                <li><a href="<%= request.getContextPath() %>/adminboard/adminBoardSelectAll" class="submenuLink">공지사항 게시판</a></li>
			            </ul>
			        </li>
			    </ul>
			</div>
				

		<!-- top 아이콘 -->
		<div style="position:fixed; bottom: 20px; right:25px;">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img/topbutton.png" width="50" height="50" title="상단으로"></a>
		</div>			 
		<br>
<script type="text/javascript">
     $(document).ready(function() {
     	weathers();
     });
 	
     function weathers() {
         $.ajax({
             type: 'GET',
             url: 'http://192.168.0.55:5001/weather_api/weather',
             dataType: 'json',
             success: function (result) {
                 var hour = result[0];
                 var temp = result[1];
                 var wfKor = result[2];
                 var pop = result[3];
                 var icon = result[4];
             	
                 // 아이콘이 설정되어 있다면 이미지 태그를 추가하고 스타일 조절
                 if (icon) {
                     htmlContent = "<img src='" + icon + "' alt='Weather Icon'>";
                 }
                 // 텍스트를 포함한 HTML 설정
                 htmlContent += "<br>[서울시 날씨]<br>온도: " + temp + "°C<br>날씨: " + wfKor + "<br>강수확률: " + pop + "%";
                 // HTML을 출력
                 $('#a').html(htmlContent);
                 //$('#a').html("[인천시 부평구 날씨]<br>시간: " + hour + "시<br>온도: " + temp + "°C<br>날씨: " + wfKor +"<br>강수확률: " + pop + "%");
              	
                 // weathers() 함수 성공 후에 mans() 함수 호출
                 getAllImages();
             },
             error: function (xhr, status, error) {
                 alert(xhr + ':' + status + ':' + error);
             }
         });
     }
</script>
<!-- CDN js bundle with popper -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->

</body>
</html>



