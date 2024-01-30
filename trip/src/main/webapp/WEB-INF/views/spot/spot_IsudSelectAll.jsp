<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.spot.vo.SpotVO" %>
<%@ page import="java.util.List" %> 

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8");%>	
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("spot_IsudSelectAll.jsp 페이지 진입 >>> : ");
	
	// 페이지 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	
	Object objPaging = request.getAttribute("pagingSVO"); 
	SpotVO pagingSVO = (SpotVO)objPaging;
	
	Object obj = request.getAttribute("listAll");
	List<SpotVO> list = (List<SpotVO>)obj;
	
	int nCnt = list.size();
	String nCntS = ":::: 전체 조회 건수 " + nCnt + "건"; 
%>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관광정보 (ISUD)</title>
		
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
			console.log("자바스크립트 진입 >>> : ");
			
			$(document).ready(function(){
				console.log("jQuery 진입 >>> : ");
				
			// 체크박스 확인
			$(document).on("click", "#chkAll", function(){
				
				if($(this).prop('checked')){
					$('.tripnum').prop('checked',false);
				}
			});
			

			// bnum 체크 확인
			$(document).on("click", "#tripnum", function(){
				
				if($(this).prop('checked')){
					$('.tripnum').prop('checked',false);
					$(this).prop('checked',true);
				}
				alert("선택완료");
			});	
			
			// I
			$(document).on("click", "#insertBtn", function(){
				console.log("insertBtn >>> : ");
				
				location.href="spot_ISUD";
			});
			
			
			
			// SALL
			$(document).on("click", "#selectAllBtn", function(){
				console.log("selectAllBtn >>> : ");
				
				$('#tripList').attr({
					'action' : 'spot_IsudSelectAll',
					'method' : 'GET',
				}).submit();
			});
			
			
			
			// S(U)
			$(document).on("click", "#selectBtn", function(){
				console.log("selectBtn >>> : ");
				
				if($('.tripnum:checked').length == 0){
						alert("수정할 글 번호 하나를 선택하세요");
						
						return;
					}
				
				
				$('#tripList').attr({
					'action' : 'spot_IsudSelect',
					'method' : 'GET',
				}).submit();
			});
			
		
			
			// D
			$(document).on("click", "#deleteBtn", function(){
				console.log("deletetBtn >>> : ");
				
				if($('.tripnum:checked').length == 0){
					alert("삭제할 글 번호 하나를 선택하세요");
					
					return;
				}
				
				$('#tripList').attr({
					'action' : 'spot_IsudDelete',
					'method' : 'GET',
				}).submit();
			});
		});			
		</script>		
	</head>
	<body>
			<div class= "container">
				<form name="tripList" id="tripList">
					<table>
						<thead>
							<tr>
								<td colspan="7">
									<h3>관광정보 (ISUD)</h3>
									<%-- nCntS --%>
								</td>
							</tr>
							<tr>
								<th>
									<input type="checkbox" name="chkAll" id="chkAll"> 
								</th>
								<th>번호</th>
								<th>사진</th>
								<th>이름</th>
								<th>지역</th>
								<th>분야</th> <!-- 카테고리 -->
								<th>조회수</th>
							</tr>
						</thead>
<%  
for(int i=0; i < nCnt; i++){
	SpotVO _svo = list.get(i);
	
	// 페이지 세팅
	pageSize = Integer.parseInt(pagingSVO.getPageSize());
	groupSize = Integer.parseInt(pagingSVO.getGroupSize());
	curPage = Integer.parseInt(pagingSVO.getCurPage());
	totalCount = Integer.parseInt(_svo.getTotalCount());
%>						
						<tbody>
							<tr>
								<td style="width:5%">
									<input type="checkbox" name="tripnum" id="tripnum" class="tripnum" value=<%= _svo.getTripnum() %>>
								</td>
								<td style="width:10%"><%= _svo.getTripnum() %></td>
								<%-- <td style="width:10%"><img src="<%= _svo.getTripimage() %>" border="1" width="25" height="25" alt="image"></td> --%>  
								<td style="width:10%"><img src="${pageContext.request.contextPath}/resources/images/img_spot/<%= _svo.getTripimage() %>" border="1" width="25" height="25" alt="image"></td> 
								
								<td style="text-align:left;"><%= _svo.getTripname() %></td>
								<td style="width:10%"><%= _svo.getTripregion() %></td>
								<td style="width:10%"><%= _svo.getTripcatalogue() %></td>
								<td style="width:8%"><%= _svo.getSpothit() %></td>
							</tr>
<%
} // 종료
 %>						
 							<tr>
 								<td colspan="7">
 									<jsp:include page="spot_IsudPaging.jsp" flush="true">
 										<jsp:param name="url" value="spot/spot_IsudSelectAll"/>
 										<jsp:param name="str" value=""/>
 										<jsp:param name="pageSize" value="<%= pageSize %>"/>
 										<jsp:param name="groupSize" value="<%= groupSize %>"/>
 										<jsp:param name="curPage" value="<%= curPage %>"/>
 										<jsp:param name="totalCount" value="<%= totalCount %>"/>
 									</jsp:include>
 								</td>
 							</tr>
 							<tr>
 								<td colspan="7">
 									<button type="button" id="insertBtn">등록</button>
 									<button type="button" id="selectAllBtn">목록</button>
 									<button type="button" id="selectBtn">수정</button>
 									<button type="button" id="deleteBtn">삭제</button>
 								</td>
 							</tr> 		
						</tbody>
					</table>
				</form>
			</div>
	</body>
</html>