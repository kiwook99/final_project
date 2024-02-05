<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			
			ul, li {
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
			
			
			a:link, a:visited, a:focus, a:active { /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
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
		

			body {
			    font-size: 17px;
			}
						
			/*카테고리*/
			#topMenu { 

			 width: 100%; 
			 margin: 0 auto;
			 }
			 
			 #topMenu ul{
				 list-style-type: none;
				 margin: 0px;
				 padding: 0px; 
				 font-size : 20px;
				 text-align: center;
			 }
			 
			 #topMenu ul li 
			 { 
			 list-style: none; 
			 display: inline-block;
			 line-height: 30px; 
			 vertical-align: middle; 
			 text-align: center;
			 position: relative;
			 }
			 
			 .submenuLink{
				 text-decoration:none;
				 display: block;
				 width: 150px;
				 font-size: 12px;
				 font-weight: bold;
				 font-family: "Trebuchet Ms", Dotum;
			 }
			 
			  #topMenu { 
			 color: white; 
			 background-color: #aaa; }
			
			 .submenuLink{
/* 				 color: white; */
				 background-color: #aaa;
				 border: solid 1px white;
				 margin-top: -1px;
			 }
			 
			 .sb{
				 position: absolute;
				 height: 0px;
				 overflow: hidden;
				 transition: height .2s;
			 }
			 
			 .topMenuLi:hover .sb{
				 height: 100px;
			 }
			 
			 .submenuLink:hover { 
			 color: black;
			 background-color: #aaa;
			 margin-right: 15px;
			 }		
			 
			 h1 {
			 	text-align: center;
			 }
			 
			 
		 	 .area {
		    position: absolute;
		    background: rgba(0, 0, 0, 0.5);
		    border-radius: 20px;
		    color: #fff;
		    font-weight: 700;
		    top: 10px; /* 조절할 수 있는 값으로 변경 */
		    left: 10px; /* 조절할 수 있는 값으로 변경 */
			}
	
			.area::before {
			    content: '';
			    display: inline-block;
			    background: url('${pageContext.request.contextPath}/resources/images/지도.png') 0 0 / 100% 100% no-repeat;
			    width: 11px;
			    height: 13px;
			    margin-right: 3px;
		        vertical-align: -1px;
			}
			 
		
			.area {
			    height: 26px;
			    line-height: 26px;
			    padding: 0 10px;
			    font-size: 13px;
			}
			
			.name strong {
			    font-size: 16px;
			    color: #000;
			}
	

			
			#loginBtn {
				padding: 5px 15px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
			}
			
			
			#logoutBtn {
				padding: 5px 15px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
			}									
			
			.logo {
			    text-align: center;
			}
			
			.loginBtn {
			    text-align: right;
			    margin-right: 80px;
			}

			
		</style>
</head>
<body>
	<br>
		<div id="header">
		    <div class="logo">
		        <a href="spot_IsudSelectAll">
		            <!-- <img src="${pageContext.request.contextPath}/resources/images/img_spot/지도.png" width="50px" height="50px" title="로고 이미지">  -->
		            <i class="fa-solid fa-plane-up fa-xl">여행가기 좋은날</i>
		        </a>
		    </div>
		</div>
		
 			<div class="loginBtn">
			    <c:choose>
			        <c:when test="${loginCheck}">
			            <!-- 조건이 참일 때 보이는 태그 -->
        			    <input type="button" name="login" id="loginBtn" value="로그인" onclick="location.href='#'">
			        </c:when>
			        <c:otherwise>
			            <!-- 조건이 거짓일 때 보이는 태그 -->
			            <input type="button" name="login" id="logoutBtn" value="로그아웃" onclick="location.href='#'">
			        </c:otherwise>
			    </c:choose>
			</div>		
		
		

		<br>
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
			<br><br><br>	
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