<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.log4j.LogManager"%>

<%@ page import="take.a.trip.hotel.vo.HotelVO" %> 
<%@ page import="java.util.List" %>  

<%@ page import="take.a.trip.hotel.util.CommonUtils" %>

<% request.setCharacterEncoding("UTF-8");%>	
<% 	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("hotel_main 페이지");	
%>    
<%

	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	Object objPaging = request.getAttribute("pagingHVO");
	HotelVO pagingHVO = (HotelVO)objPaging;

	Object obj = request.getAttribute("listAll");
	
	Object objAdmin = request.getAttribute("adminyn");
	List<HotelVO> list = (List<HotelVO>)obj;
	int nCnt = list.size();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Main</title>
<!-- 스타일 -->
		<style type="text/css">
		
		.list_content ul {
			display: flex; 		/* flex : 수평으로 나열*/
			flex-wrap: wrap;	/* 화면 크기에 따라 자동 줄바꿈 */
			place-content: center;
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
		    margin: 20px 20px 40px 0;
		    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
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
		
		a:link, a:visited, a:focus, a:active { /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
	    text-decoration: none;
	    color: black;
		}	
				
	 .regionarea {
	    position: absolute;
	    background: rgba(0, 0, 0, 0.5);
	    border-radius: 20px;
	    color: #fff;
	    font-weight: 700;
	    top: 10px; /* 조절할 수 있는 값으로 변경 */
	    left: 10px; /* 조절할 수 있는 값으로 변경 */
	    height: 26px;
	    line-height: 26px;
	    padding: 0 10px;
	    font-size: 13px;
	}
	
	.regionarea::before {
	    content: '';
	    display: inline-block;
	    background: url('${pageContext.request.contextPath}/resources/images/지도.png') 0 0 / 100% 100% no-repeat;
	    width: 11px;
	    height: 13px;
	    margin-right: 3px;
        vertical-align: -1px;
	}
	 

	.name strong {
	    font-size: 16px;
	    color: #000;
	}
	
	.miniSearchForm{
	    margin-bottom: 20px;
	    text-align: center;
	}
	
	#search_btn{
	padding: 5px 15px;
    background-color: #0aa4b5;
    color: white;
    border: 0;
    border-radius: 10px;
	}
	
	.hotelinsert a {
	padding: 10px 25px;
    background-color: #0aa4b5;
    color: white;
    border: 0;
    border-radius: 10px;
    font-size: 15px;
	}
	
	.hotelinsert {
	text-align-last: center;
	margin-bottom: 30px;
	}
		</style>
		
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
	   $(document).ready(function(){
		      console.log("메인 페이지 접속");
		      
		      $("#search_btn").click(function(){
		         
		         $("#miniSearchForm").attr({
		            "method":"GET",
		            "action":"hotelSearch"
		         }).submit();
		      });

		        
		   });
	</script>
</head>
<body>
<%@ include file="/main.jsp" %>
		<div>
			<form class="miniSearchForm" id="miniSearchForm">
				<select id="searchFilter" name="searchFilter" style="width:100px;font-size:15px;">
					<option value="key_01">지역</option>
					<option value="key_02">숙소명</option>
				</select>			
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
				style="width:200px;height:20px;font-size:15px;">
				<input type="submit" id="search_btn" name="search_btn" value="검색">
			</form>
		</div>
		
		<% if ("Y".equals(objAdmin)) { %>
		<div class="hotelinsert">
			   <span><h3><a href="hotelInsertForm">숙소등록</a></h3></span></div>
		<% } %>		
		<hr><br><br>
		<div class="main">
			<div class="contents">
				<div class="list_content">
						<ul id="hotelList">
							<%
								for(int i=0; i<nCnt; i++){
									HotelVO hvo = list.get(i);
									
									//  페이징 세팅
									pageSize = Integer.parseInt(pagingHVO.getPageSize());
									groupSize = Integer.parseInt(pagingHVO.getGroupSize());
									curPage = Integer.parseInt(pagingHVO.getCurPage());
									totalCount = Integer.parseInt(hvo.getTotalCount());
							%>	
						<li>
							
							<!-- 숙박시설 -->
							<a href="hotelSelect?hotelnum=<%= hvo.getHotelnum() %>">
							<span class="img">
					            <%-- 이미지 소스가 URL인지 확인 --%>
					            <% if (hvo.getHotelimage().startsWith("http") || hvo.getHotelimage().startsWith("https")) { %>
					                <img src="<%= hvo.getHotelimage().indexOf(",") >= 0 ? hvo.getHotelimage().substring(0, hvo.getHotelimage().indexOf(",")) : hvo.getHotelimage() %>">
					            <% } else { %>
					                <%-- 이미지가 파일이라면 파일을 표시할 수 있는 태그로 수정 --%>
					                <img src="${pageContext.request.contextPath}/resources/fileupload/hotel/<%= hvo.getHotelimage() %>">
					            <% } %>
					        </span>
							<span class="regionarea">
								<%= hvo.getRegionid() %>
							</span>
							</span>
							<div class="name">
								 <strong><%= hvo.getHotelname().replaceAll("\"", "") %></strong>
							</div>
							</a>
							<%
								}
							%>
						</li>
					</ul>
					<div>
						<jsp:include page="hotelPaging.jsp" flush="true">
							<jsp:param name="url" value="hotel_main"/>
							<jsp:param name="str" value=""/>
							<jsp:param name="pageSize" value="<%=pageSize%>"/>
							<jsp:param name="groupSize" value="<%=groupSize%>"/>
							<jsp:param name="curPage" value="<%=curPage%>"/>
							<jsp:param name="totalCount" value="<%=totalCount%>"/>
						</jsp:include>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>