<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- 스타일 -->
		<style type="text/css">
		
			.list_content ul {
				display: flex; 		/* flex : 수평으로 나열*/
				flex-wrap: wrap;	/* 화면 크기에 따라 자동 줄바꿈 */
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
			
			
			a:link, a:visited, a:focus, a:active {
			    text-decoration: none;
			}	/* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
			
							
			
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
	 height: 50px; 
	 width: 100%; 
	 margin: 0 auto;
	 }
	 
	 #topMenu ul{
		 list-style-type: none;
		 margin: 0px;
		 padding: 0px; 
		 font-size : 20px;
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
		 color: white;
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
	 }
</style>
</head>
<body>
		<div class="header">
			<!-- 이미지 아이콘 -->
			<a href="#">
			<img src="#" width="50px" height="50px" title="로고 이미지">
			</a>
			<!-- 제목 -->
			<h1>여행가기 좋은날</h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<c:choose>
			    <c:when test="${condition}">
			        <!-- 조건이 참일 때 보이는 태그 -->
			        <input type="button" name="logout" id="logoutBtn" value="로그아웃" onclick="location.href='#'" >
			    </c:when>
			    <c:otherwise>
			        <!-- 조건이 거짓일 때 보이는 태그 -->
			        <input type="button" name="login" id="loginBtn" value="로그인" onclick="location.href='#'" >					
			    </c:otherwise>
			</c:choose>
			<input type="button" name="mypage" id="MyPageBtn" value="마이페이지" onclick="location.href='#'" >
			</form>

		</div>
		<div class="topnav">
			<!--메뉴-->
			<nav id="topMenu" >
				 <ul>
					 <li class="topMenuLi">
					 <a class="menuLink" href="#content1">여행정보</a>
					 	 <ul class ="sb">
							  <li><a href="spot" class="submenuLink " >관광정보</a></li>
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
</body>
</html>