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

						

			body {
			    font-size: 17px;
			}
						
			 
			 h1 {
			 	text-align: center;
			 }
			 
			 
			 h2 {
			 	text-align: center;
			 }			 
	

			
			#U, #B, #D {
			padding: 10px 30px;
			background-color: #0aa4b5;
			color: white;
			border: 0;
			border-radius: 10px;
			}
			
			
			.btn {
				text-align: center;
			}	
			
			
/* 		    /* 소개 부분의 텍스트 자동 줄 바꿈 설정 */ */
/* 		    .trip-introduction { */
/* 		        word-wrap: break-word; /* 텍스트가 부모 요소를 벗어날 때 자동으로 줄 바꿈 */ */
/* 		        max-width: 480px; /* 최대 너비를 지정하여 한 줄에 최대 30자까지 표시 */ */
/* 		    }		 */
		    	
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

		<h2>관광정보</h2>
		<br>
		<hr>
		<br>
			<form name="spotUpdateForm" id="spotUpdateForm">
				<input type="hidden" name="tripnum" id="tripnum" value="<%= svo.getTripnum() %>">
				<br>
				<table>
					<tr>
						<td colspan="2" height="30px">
						<img src="${pageContext.request.contextPath}/resources/images/img_spot/<%= svo.getTripimage() %>" border="1" width="500" height="300" alt="image">
						</td>
					</tr>	
							
					<tr>
						<td class="tt" width="5%"> 여행지명 <hr></td>
						<td width="50%">
							<%= svo.getTripname() %>
							<hr>
						</td>
					</tr>
					<tr><br>
						<td class="tt"> 카테고리 <hr></td>
						<td  width="50%">
							<%= svo.getTripcatalogue() %>
							<hr>
						</td>
					</tr>
					<tr>
						<td class="tt"> 소개 </td>
						<td  width="50%" class="trip-introduction">
							<%= svo.getTripcoment() %>
							<hr>
						</td>
					</tr>	
					<tr>
						<td class="tt"> 지역 <hr></td>
						<td  width="50%">
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