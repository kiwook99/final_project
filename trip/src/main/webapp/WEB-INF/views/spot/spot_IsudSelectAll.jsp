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
			
			 
			 h1 {
			 	text-align: center;
			 }
			 
			/* 위치 */ 
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
	

			#search_btn, #insertBtn, #selectAllBtn, #selectBtn, #deleteBtn {
				padding: 10px 25px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
				font-size: 15px;
			}

			#btn {
				text-align: center;
			}
			
			h2{text-align: center;}
			
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
		<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2>관광정보 (ISUD)</h2>
		<br>
		<hr>
		<br>
		<!-- 검색 -->
		<div id="header">
				<form name="miniSearchForm" id="miniSearchForm" action='spot_Search'> 
				<select id="searchFilter_1" name="searchFilter_1" style="width:100px;font-size:15px;">
					<option value="key_01">지역별</option>
					<option value="key_02">분야별</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
				style="width:350px;height:30px;font-size:15px;">
				<input type="button" id="search_btn" name="search_btn" value="검색">
				</form>		
		</div>
		<br>
			<div id="btn">
				<button type="button" id="insertBtn">여행지 등록</button>
			</div>
		<br>
		
		<br><br>
			<div class= "main">
				<div class="contents">
					<div class="list_content">
						<ul id="tripList">
	
<%  
for(int i=0; i < nCnt; i++){
	SpotVO svo = list.get(i);
	
	
	// 페이지 세팅
	pageSize = Integer.parseInt(pagingSVO.getPageSize());
	groupSize = Integer.parseInt(pagingSVO.getGroupSize());
	curPage = Integer.parseInt(pagingSVO.getCurPage());
	totalCount = Integer.parseInt(svo.getTotalCount());
%>						

							<li>  
								<a href="spot_IsudSelect?tripnum=<%= svo.getTripnum() %>">
								<span class="img">
									<img src="${pageContext.request.contextPath}/resources/images/img_spot/<%= svo.getTripimage() %>" border="1" width="25" height="25" alt="image">
								<span class="area">
								 	<%= svo.getTripregion() %>
								 </span>
								 </span>
								 <div class="name">
									<strong><%= svo.getTripname() %></strong> 
								 </div>
								</a>
							<%
								} // 종료
							%>						
							</li>
				</ul>
						<jsp:include page="spot_IsudPaging.jsp" flush="true">
							<jsp:param name="url" value="spot_IsudSelectAll"/>
							<jsp:param name="str" value=""/>
							<jsp:param name="pageSize" value="<%= pageSize %>"/>
							<jsp:param name="groupSize" value="<%= groupSize %>"/>
							<jsp:param name="curPage" value="<%= curPage %>"/>
							<jsp:param name="totalCount" value="<%= totalCount %>"/>
						</jsp:include>	
					</div>
				</div>
			</div>
			
			<br><br>
	</body>
</html>

