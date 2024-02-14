<!--게시판 전체조회  html, form -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="take.a.trip.board.vo.BoardVO"%>
<%@ page import="java.util.List" %>

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("BoardSelectAll.jsp 페이지 >>> : ");
	 
	//페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;

	Object objPaging = request.getAttribute("pagingBVO");
	BoardVO pagingKBVO = (BoardVO)objPaging;
	
	Object obj = request.getAttribute("ListAll");
	if (obj == null){ return; }
	//BoardVO 호출
	List<BoardVO> list = (List<BoardVO>)obj;
	
//	int nCnt = list.size();
//	String nCntS = ":::: 전체 조회 건수  " + nCnt + " 건";	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


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
		
		#searchForm {
			text-align: center;
		}
		
		#search_btn, #writeBtn {
			padding: 10px 25px;
			background-color: #0aa4b5;
			color: white;
			border: 0;
			border-radius: 10px;
			font-size: 15px;
		}		
		
	    #writeBtn:hover, #search_btn:hover {
	      	 background-color: #0bc5da;
			 transition-duration: 0.5s;
	      }			
</style>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2> 자유 게시판 </h2>
		<br>
		<hr>
		<br>
<form name="boardListForm" id="boardListForm">
<table>
	<thead>
      <thead>
          <tr>
              <td colspan="4" style="text-align:center;color:white; background-color:#0aa4b5;">
                  <h3> 자유 게시판</h3>
              </td>
          </tr>
          <tr>
              <th class="col1">번호</th>    
		      <th class="col2">제목</th>
		      <th class="col3">글쓴이</th>    
		      <th class="col4">날짜</th> 
          </tr>
      </thead>
	
<%
	if (list.size() > 0){
		for (int i=0; i < list.size(); i++){
			BoardVO bvo = list.get(i);
			
			// 페이징 세팅
			pageSize = Integer.parseInt(pagingKBVO.getPageSize());
			groupSize = Integer.parseInt(pagingKBVO.getGroupSize());
			curPage = Integer.parseInt(pagingKBVO.getCurPage());
			totalCount = Integer.parseInt(bvo.getTotalCount());
%>			
      <tbody>
		<tr>
			<td><%= bvo.getBoardnum() %></td>		
			<td>
				<a href="boardSelect?boardtitle=<%= bvo.getBoardtitle() %>"><%= bvo.getBoardtitle() %></a>				
			</td>
			<td><%= bvo.getMemnum() %></td>
			<td><%= bvo.getInsertdate() %></td>
		</tr>			
<%		
		} // end of for
%>
		<tr>
			<td colspan="4">
<!--페이징을 위해  <td colspan="4" style="text-align:right"> 지우고 jsp:include page="boardPaging.jsp" flush="true" 추가 -->
				<jsp:include page="boardPaging.jsp" flush="true">
					<jsp:param name="url" value="boardSelectAll"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
				</jsp:include>
			</td>
		</tr>		
		<tr>
			<td colspan="4" style="text-align:right">
				<input type="button" id="writeBtn" value="글쓰기" />
			</td>
		</tr>
<%		
	}
%>
	</tbody>
</table>
<br><br>
</form>
		<!-- 검색 -->
		<div id="header">
				<form name="searchForm" id="searchForm" action='boardSearchSelect'> 
				<select id="searchFilter" name="searchFilter" style="width:100px;font-size:15px;">
					<option value="key_00">카테고리</option>
					<option value="key_01">제목</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" 
				style="width:350px;height:30px;font-size:15px;">
				<input type="button" id="search_btn" name="search_btn" value="검색">
				</form>		
				<br>					
		</div>

<script type="text/javascript">
	//alert("자바스크립트 블럭 진입 >>> : ");
	
	$(document).ready(function(){
		//alert("jQuery ready() 함수 블럭 진입 >>> : ");
		

		//  글쓰기 
		$(document).on("click", "#writeBtn", function(){
			//alert("글쓰기 버튼 클릭 :: writeBtn");
			//입력폼의 memnum(닉네임)고정
			location.href="boardInsertForm?memnum=<%=memid%>";
		});
		// 검색
	      $("#search_btn").click(function(){
		         
		         $("#searchForm").attr({
		        	 'method':'GET'
		         }).submit();
		      });	
		
	});	

</script>

</body>
</html>