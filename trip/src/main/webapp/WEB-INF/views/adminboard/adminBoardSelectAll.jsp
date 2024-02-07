<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.adminBoard.vo.AdminBoardVO" %>
<%@ page import="take.a.trip.adminBoard.common.CommonUtils" %>
<%@ page import="java.util.List" %>
 
<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminBoardSelectAll.jsp 페이지 >>> : ");
	
	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;

	Object objPaging = request.getAttribute("pagingABVO");
	AdminBoardVO pagingABVO = (AdminBoardVO)objPaging;
	
	Object obj = request.getAttribute("listAll");
	List<AdminBoardVO> list = (List<AdminBoardVO>)obj;

%>    
<% 
int nCnt = 0; // 변수를 바깥으로 이동하여 선언

if (list != null) {
    nCnt = list.size();
}
%>
<% Object objAdmin = request.getAttribute("adminyn"); %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 : 게시판</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//alert("자바스크립트 블럭 진입 >>> : ");
	// abnum 체크박스 체크 확인하기
	$(document).on("click", "#adboardnum", function(){				
		
		if($(this).prop('checked')){			 			
			$('.adboardnum').prop('checked',false);
			$(this).prop('checked',true);
		}
	});
	
	$(document).ready(function(){

		$(document).on("click", "#abBtn", function(){
			
			location.href="adminBoardInsertForm";
		});	
			
	});	
	

</script>
 <style type="text/css">
        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 60%;
            margin: 0 auto;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        .col1 {
	        width: 10%;
	    }
	
	    .col2 {
	        width: 40%;
	    }
	    
	    .col3, .col4 {
	    	width: 10%;
	    }
	    
	    .col5 {
	    	width: 5%;
	    }

        button {
            padding: 5px 15px;
            background-color: #0aa4b5;
            color: white;
            border: 0;
			border-radius: 10px;
            cursor: pointer;
            display: flex;
        	float: right; /* 오른쪽으로 이동 */
        }


		a:link { /* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
		    text-decoration: none;
		    color: black;
		}	

		
		#abBtn:hover {
        	 background-color: #0bc5da;
			 transition-duration: 0.5s;
        }
		
    </style>
    <!-- 폰트 어썸 CDN -->
    <script src="https://kit.fontawesome.com/2211a5118a.js" crossorigin="anonymous"></script>	
</head>
<body>
<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2> 공지사항 글 목록 </h2>
		<br>
		<hr>
		<br>	

<form name="adminboardList" id="adminboardList">
   <table>
      <thead>
          <tr>
              <td colspan="5" style="text-align:center;color:white; background-color:#0aa4b5;">
                  <h3>공지사항</h3>
              </td>
          </tr>
          <tr>
              <th class="col1">글번호</th>    
		      <th class="col2">제목</th>
		      <th class="col3">글쓴이</th>    
		      <th class="col4">날짜</th>
		      <th class="col5">조회수</th>
          </tr>
      </thead>
<%
for(int i=0; i<nCnt; i++){		
	AdminBoardVO _abvo = list.get(i);	
	
	// 페이징 세팅
	pageSize = Integer.parseInt(pagingABVO.getPageSize());
	groupSize = Integer.parseInt(pagingABVO.getGroupSize());
	curPage = Integer.parseInt(pagingABVO.getCurPage());
	totalCount = Integer.parseInt(_abvo.getTotalCount());
%>
      <tbody>
      <tr>
		<td style="width:5%"><%= _abvo.getAdboardnum() %></td>			
		<td style="width:10%"><a href="adminBoardSelect?adboardnum=<%= _abvo.getAdboardnum() %>"><%= _abvo.getAdboardtitle() %> </td>
		<td style="text-align:center;">관리자</td>	
		<td style="width:10%"><%= _abvo.getInsertdate() %></td> 
		<td style="width:8%"><%= _abvo.getAdboardhits() %></td>				
	 </tr>	
<%
}//end of for
%>
 
<%
int curGroup = 0;

if (groupSize != 0) {
    curGroup = (curPage - 1) / groupSize;
}
%>		

                
                <tr>
	<td colspan="7">
		<jsp:include page="adminBoardPaging.jsp" flush="true">
			<jsp:param name="url" value="adminBoardSelectAll"/>
			<jsp:param name="str" value=""/>
			<jsp:param name="pageSize" value="<%=pageSize%>"/>
			<jsp:param name="groupSize" value="<%=groupSize%>"/>
			<jsp:param name="curPage" value="<%=curPage%>"/>
			<jsp:param name="totalCount" value="<%=totalCount%>"/>
		</jsp:include>
	</td>
</tr>
                               
                <% if ("Y".equals(objAdmin)) { %>
                
					   <!-- 관리자만 볼수있는 태그-->
				    <tr>
                	<td colspan="5" class="right">
                	<button type="button" value="글쓰기" id="abBtn">글쓰기</button>
              	    </td>      	
                	</tr>
				<% } %>
				    
      </tbody>
   </table>
</form>
<br><br><br>
</body>
</html>