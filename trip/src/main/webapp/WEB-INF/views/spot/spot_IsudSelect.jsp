<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="take.a.trip.spot.vo.SpotVO" %>
    <%@ page import="java.util.List" %> 
        
<% request.setCharacterEncoding("UTF-8");%>	
<%
	Object obj = request.getAttribute("listS");
	if (obj == null) return;
	
	List<SpotVO> list = (List<SpotVO>)obj;
	int nCnt = list.size();
	
	SpotVO svo = null;
	if(nCnt == 1) {
		svo = list.get(0);
	}
%>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
				<!-- 스타일 -->
		<style type="text/css">
			table {
				text-align: center;	
 				margin: 0 auto; 
			}
			
			#miniSearchForm {
				text-align: center;	
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
			    display: block;
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
			 
			 h1 {
			 	text-align: center;
			 }
			 
			 
			 h2 {
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
	

			.btn {
				text-align: center;
				
			}
			
			#U, #B, #D {
			padding: 10px 30px;
			background-color: #0aa4b5;
			color: white;
			border: 0;
			border-radius: 10px;
			}
			
			
			#imgs {
				margin: 0px 100px;
			}
			
			
			
		</style>	
		<!-- 폰트 어썸 CDN -->
		<script src="https://kit.fontawesome.com/2211a5118a.js" crossorigin="anonymous"></script>	
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
		console.log("자바스크립트 진입 >>> : ");
		
		$(document).ready(function(){	
			console.log("jQuery 진입 >>> : ");
			
		
			//  U
			$(document).on("click", "#U", function(e){
				
				e.preventDefault();
				$("#spotUpdateForm").attr({ 
					"method":"GET", 
					"action":"spot_IsudSelect_admin"
// 					"action":"spot_IsudUpdate"
				}).submit();
			});
			
			
			
			
			
			
			// D
			$(document).on("click", "#D", function(e){
				
				e.preventDefault();
				$("#spotUpdateForm").attr({ 
					"method":"GET", 
					"action":"spot_IsudDelete"
				}).submit();
			});
			
			// B
			$(document).on("click", "#B", function(e){
					
				location.href = "spot_IsudSelectAll";
			});
			
		});			
		</script>		
	</head>
	<body>
	<%@ include file="/main.jsp" %>
		<!-- 검색 -->
		<div id="header">
				<form name="miniSearchForm" id="miniSearchForm" action='spot_Search'> 
				<select id="searchFilter_1" name="searchFilter_1" style="width:100px;font-size:15px;">
					<option value="key_01">지역별</option>
					<option value="key_02">분야별</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
				style="width:200px;height:30px;font-size:15px;">
				<input type="button" id="search_btn" name="search_btn" value="검색">
				</form>		
		</div>
		<br>
		<hr>
		<h2>관광정보</h2>
		<hr>
		<br>
			<form name="spotUpdateForm" id="spotUpdateForm">
				<div id="imgs">
				<img src="${pageContext.request.contextPath}/resources/images/img_spot/<%= svo.getTripimage() %>" border="1" width="500" height="300" alt="image">
				</div>
				<input type="hidden" name="tripnum" id="tripnum" value="<%= svo.getTripnum() %>">
				<br>
				<table width="60%">				
					<tr>
						<td class="tt" width="5%"> 여행지명 <hr></td>
						<td width="50%">
							<%= svo.getTripname() %>
							<hr>
						</td>
					</tr>
					<tr>
						<td class="tt"> 카테고리 <hr></td>
						<td>
							<%= svo.getTripcatalogue() %>
							<hr>
						</td>
					</tr>
					<tr>
						<td class="tt"> 소개 </td>
						<td>
							<%= svo.getTripcoment() %>
							<hr>
						</td>
					</tr>	
					<tr>
						<td class="tt"> 지역 <hr></td>
						<td>
							<%= svo.getTripregion() %>
							<hr>
						</td>
					</tr>	
				<tr>
					<td colspan="3">

					</td>	
				</tr>																							
				</table>
				
				<br>
				<div class="btn">
					<button type="button" id="U">수정</button>&nbsp;&nbsp;&nbsp;
					<button type="button" id="D">삭제</button>&nbsp;&nbsp;&nbsp;
					<button type="button" id="B">돌아가기</button>
				</div>
			</form>
			<div class="main">
				<div class="contents">
					<div class="sub_header">
					<!-- 제목 -->
					</div>
					<div class="sub_content">
						<div class="sub_search">
							<!-- 조건 검색 -->
						</div>
						<div class="sub_list">
							<div class="list_head">
								<!-- 페이지 수 -->
							</div>
							<div class="list_content">
								<!-- 관광지 -->
								<ul id="spotList">
									<!-- 데이터 들어갈 것임 -->
								</ul>
								<div id="buttonContainer"></div>							
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
		<!-- 댓글 처리 -->
		<jsp:include page="spot_IusdComment.jsp">  
			<jsp:param value="<%= svo.getTripnum() %>" name="tripnum" />
		</jsp:include>				
	</body>
</html>