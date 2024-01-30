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

		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
		console.log("자바스크립트 진입 >>> : ");
		
		$(document).ready(function(){	
			console.log("jQuery 진입 >>> : ");
			
		
			//  U
			$(document).on("click", "#U", function(e){
				alert("U");
				e.preventDefault();
				$("#spotUpdateForm").attr({ 
					"method":"GET", 
					"action":"spot_IsudUpdate"
				}).submit();
			});
			
			// D
			$(document).on("click", "#D", function(e){
				alert("D");
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
		<h3>관광정보 조회</h3>
		<hr>
			<form name="spotUpdateForm" id="spotUpdateForm">
				<table>
					<tr>
						<td colspan="2"> 정보 </td>
					</tr>
				<tr>
					<td colspan="2">
					<img src="http://localhost:8088/trip/resources/fileupload/spot/<%= svo.getTripimage() %>" border="1" width="40" height="50" alt="image">
					</td>
				</tr>					
					<tr>
						<td class="tt"> 여행지 번호 </td>
						<td>
							<input type="text" name="tripnum" id="tripnum" value="<%= svo.getTripnum() %>" readonly>
						</td>					
					</tr>
					<tr>
						<td class="tt"> 여행지 이름 </td>
						<td>
							<input type="text" name="tripname" id="tripname" size="40" value="<%= svo.getTripname() %>">
						</td>
					</tr>
					<tr>
						<td class="tt"> 여행지 카테고리 </td>
						<td>
							<input type="text" name="tripcatalogue" id="tripcatalogue" size="30" value="<%= svo.getTripcatalogue() %>">
						</td>
					</tr>
					<tr>
						<td class="tt"> 여행지 소개 </td>
						<td>
							<textarea name="tripcoment" id="tripcoment" cols="42" rows="20"><%= svo.getTripcoment() %></textarea>
						</td>
					</tr>	
					<tr>
						<td class="tt"> 여행지 지역 </td>
						<td>
							<input type="text" name="tripregion" id="tripregion" size="30" value="<%= svo.getTripregion() %>">
						</td>
					</tr>	
				<tr>
					<td colspan="3">
					<button type="button" id="U">수정</button>
					<button type="button" id="D">삭제</button>
					<button type="button" id="B">돌아가기</button>
					</td>	
				</tr>																							
				</table>
			</form>
	</body>
</html>