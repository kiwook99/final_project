<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 	//세션에서 값을 가져오기
	String memid = (String) session.getAttribute("memid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- 폰트 어썸 CDN -->
		<script src="https://kit.fontawesome.com/2211a5118a.js" crossorigin="anonymous"></script>	
		<!-- 스타일 -->
		<style type="text/css">
		
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
			}
			
			.menu > li {
			  width: 100%;
			  text-align: center;
			  line-height: 40px;
			  background-color: #0aa4b5;
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
		
			#loginBtn {
				padding: 10px 20px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
				font-size: 15px;
			}
			
			#logoutBtn {
				padding: 10px 20px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
				font-size: 15px;
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
			}
				
			 h1 {
			 	text-align: center;
			 }
			 
			 .weatherIcon{
			 margin-left: 25px;
		     float: left;
		     height: 40px;
		     margin-top: -88px;
			 }
			 
			 #header{
			 height: 103px;
			 }
			 
			 	
		</style>
</head>
<body>
	<br>
		<div id="header">
		    <div class="logo">
		        <a href="<%= request.getContextPath() %>/spot/spot_IsudSelectAll">
		            <!-- <img src="${pageContext.request.contextPath}/resources/images/img_spot/지도.png" width="50px" height="50px" title="로고 이미지">  -->
		            <i class="fa-solid fa-plane-up fa-xl">여행가기 좋은날</i>
		        </a>		        

		    </div>
		    <div id="weatherIcon" class="weatherIcon" style="margin-left: 10px;">
                   <a href="https://www.weather.go.kr/w/index.do#dong/2811058500/37.47405/126.63111/%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C%20%EC%A4%91%EA%B5%AC%20%EB%8F%99%EC%9D%B8%EC%B2%9C%EB%8F%99//">
                       <h3 id="a" class="a"></h3>
                   </a>
		    </div>

 			<div class="loginBtn">
			    		


			        <% if(memid != null) { %> 
			            <!-- 조건이 참일 때 보이는 태그 -->
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
						 <a class="menuLink" href="<%= request.getContextPath() %>/spot/spot">여행정보</a>
						 <hr>
						 	 <ul class ="sb">
								  <li><a href="<%= request.getContextPath() %>/spot/spot" class="submenuLink" >관광정보</a></li>
								  <li><a href="<%= request.getContextPath() %>/spot/spot_IsudSelectAll" class="submenuLink" >관광정보(ISUD)</a></li>
						  	</ul>
						 </li>							  
						 <li class="topMenuLi">
						 <a class="menuLink" href="<%= request.getContextPath() %>/hotel/hotel_main">숙소예약</a>
						 <hr>
						 	<ul class ="sb"> 
								 <li><a href="<%= request.getContextPath() %>/hotel/hotel_main" class="submenuLink" >숙소정보</a></li>
						 	</ul>
						 </li>
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content3">게시판</a>
						 	<ul class ="sb"> 
								 <li><a href="#" class="submenuLink" >자유 게시판</a></li>
								 <li><a href="<%= request.getContextPath() %>/adminboard/adminBoardSelectAll" class="submenuLink" >공지사항 게시판</a></li>
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
             url: 'http://192.168.0.4:5001/weather_api/weather',
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
</body>
</html>



<%-- 			
		<div class="topnav">
				<!--메뉴-->
				<nav id="topMenu" >
					 <ul>
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content1">여행정보</a>
						 	 <ul class ="sb">
								  <li><a href="spot" class="submenuLink" >관광정보</a></li>
								  <li><a href="spot_ISUD" class="submenuLink" >관광정보(ISUD)</a></li>
						  	</ul>
						 </li>							  
						  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>					  
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content2">숙소예약</a>
						 	<ul class ="sb"> 
								 <li><a href="<%= request.getContextPath() %>/hotel/hotel_main" class="submenuLink" >숙소정보</a></li>
						 	</ul>
						 </li>
						  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>					  
						 <li class="topMenuLi">
						 <a class="menuLink" href="#content3">게시판</a>
						 	<ul class ="sb"> 
								 <li><a href="#" class="submenuLink" >자유 게시판</a></li>
								 <li><a href="#" class="submenuLink" >공지사항 게시판</a></li>
						 	</ul>
						 </li>				 
					 </ul> 
				 </nav>
			</div>	
			 --%>