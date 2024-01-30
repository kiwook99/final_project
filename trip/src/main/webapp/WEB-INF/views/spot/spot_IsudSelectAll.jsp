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
	

%>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관광정보 (ISUD)</title>
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

		</style>	
		<!-- 폰트 어썸 CDN -->
		<script src="https://kit.fontawesome.com/2211a5118a.js" crossorigin="anonymous"></script>	
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
			
			// 검색
		      $("#search_btn").click(function(){
			         alert('검색합니다.');
			         
			         $("#miniSearchForm").attr({

			        	 'method':'GET'
			         }).submit();
			      });
		});		
			
		</script>		
	</head>
	<body>
	<br>
		<!-- 검색 -->
		<div id="header">
			<table>
				<tr>
					<td>
					<!-- 이미지 아이콘 -->
						<a href="spot_IsudSelectAll">
						<!-- <img src="${pageContext.request.contextPath}/resources/images/img_spot/지도.png" width="50px" height="50px" title="로고 이미지">  -->
							<i class="fa-solid fa-plane-up fa-xl"></i> <!-- 폰트사이즈 :  fa-2xs - 0.625em - 10px / fa-xs - 0.75em - 12px / fa-sm - 0.875em - 14px / fa-lg - 1.25em - 20px / fa-xl - 1.5em - 24px / fa-2xl - 2em - 32px  -->
						</a>
						&nbsp;&nbsp;
					</td>
					<td>
					<!-- 제목 -->
					<h1>여행가기 좋은날</h1>
					</td>
				</tr>
			</table>
			<br>
				<form name="miniSearchForm" id="miniSearchForm" action='spot_Search'> 
				<select id="searchFilter_1" name="searchFilter_1" style="width:100px;font-size:15px;">
					<option value="key_01">지역별</option>
					<option value="key_02">분야별</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
				style="width:200px;height:30px;font-size:15px;">
				<input type="button" id="search_btn" name="search_btn" value="검색">
				
				<input type="button" name="login" id="loginBtn" value="로그인" onclick="location.href='#'" >
				</form>		
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
			<div class= "container">
				<form name="tripList" id="tripList">
					<table border="1">
						<thead>
							<tr>
								<td colspan="7">
									<h3>관광정보 (ISUD)</h3>
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
	SpotVO svo = list.get(i);
	
	
	// 페이지 세팅
	pageSize = Integer.parseInt(pagingSVO.getPageSize());
	groupSize = Integer.parseInt(pagingSVO.getGroupSize());
	curPage = Integer.parseInt(pagingSVO.getCurPage());
	totalCount = Integer.parseInt(svo.getTotalCount());
%>						
						<tbody>
							<tr>
								<td style="width:5%">
									<input type="checkbox" name="tripnum" id="tripnum" class="tripnum" value=<%= svo.getTripnum() %>>
								</td>
								<td style="width:10%"><%= svo.getTripnum() %></td>
								<%-- <td style="width:10%"><img src="<%= _svo.getTripimage() %>" border="1" width="25" height="25" alt="image"></td> --%>  
								<td style="width:10%"><img src="${pageContext.request.contextPath}/resources/images/img_spot/<%= svo.getTripimage() %>" border="1" width="25" height="25" alt="image"></td> 
								
								<td style="text-align:left;"><%= svo.getTripname() %></td>
								<td style="width:10%"><%= svo.getTripregion() %></td>
								<td style="width:10%"><%= svo.getTripcatalogue() %></td>
								<td style="width:8%"><%= svo.getSpothit() %></td>
							</tr>
<%
} // 종료
 %>						
 							<tr>
 								<td colspan="7" id="paging">
 									<jsp:include page="spot_IsudPaging.jsp" flush="true">
 										<jsp:param name="url" value="spot_IsudSelectAll"/>
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

