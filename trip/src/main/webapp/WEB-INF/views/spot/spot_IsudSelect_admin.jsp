<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="take.a.trip.spot.vo.SpotVO" %>
    <%@ page import="java.util.List" %> 
        
<% request.setCharacterEncoding("UTF-8");%>	
<%
	Object obj = request.getAttribute("listSa");
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
 				font-size: 20px;
 				border-radius: 5px;
			}					

			.tt {
				font-weight: bold;
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
			
			
 		    /* 소개 부분의 텍스트 자동 줄 바꿈 설정 */ 
 		    .tripcoment { 
 		        word-wrap: break-word; /* 텍스트가 부모 요소를 벗어날 때 자동으로 줄 바꿈 */ 
 		        max-width: 480px; /* 최대 너비를 지정하여 한 줄에 최대 30자까지 표시 */ 
 		        height: 200px; /* 원하는 높이로 설정하세요 */
 		        
 		    }

		</style>	
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
 					"action":"spot_IsudUpdate"
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
					
				window.history.back();
			});
			
		});			
		</script>		
	</head>
	<body>
	<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2>관광정보</h2>
		<br>
		<hr>
		<br>
		   <!-- 이미지 부분을 테이블 외부로 이동 -->
		   <div style="text-align: center;">
		       <img src="${pageContext.request.contextPath}/resources/images/img_spot/<%= svo.getTripimage() %>" border="1" width="600" height="400" alt="image">
		   </div>			
			<form name="spotUpdateForm" id="spotUpdateForm">
				<input type="hidden" name="tripnum" id="tripnum" value="<%= svo.getTripnum() %>">
				<br>
				<table>				
					<tr>
						<td class="tt" width="5%" height="40px"> 여행지명 <hr></td>
						<td class="tt" width="50%">
							<input type="text" name="tripname" id="tripname" value="<%= svo.getTripname() %>" size="40">
							<hr>
						</td>
					</tr>
					<tr>
						<td class="tt" height="40px"> 카테고리 <hr></td>
						<td class="tt">
						<input type="text" name="tripcatalogue" id="tripcatalogue" value="<%= svo.getTripcatalogue() %>" size="40">
							<hr>
						</td>
					</tr>
					<tr>
						<td class="tt" height="40px"> 소개 </td>
						<td class="tt">
						<textarea name="tripcoment" id="tripcoment" cols="100" rows="20"><%= svo.getTripcoment() %></textarea> 
							<hr>
						</td>
					</tr>	
					<tr>
						<td class="tt" height="40px"> 지역 <hr></td>
						<td class="tt">
						<input type="text" name="tripregion" id="tripregion" value="<%= svo.getTripregion() %>" size="40">						
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
				<br><br>
			</form>			
	</body>
</html>