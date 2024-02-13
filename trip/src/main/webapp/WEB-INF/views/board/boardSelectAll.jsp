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
	
	h3 {
		text-align: center;
	}
	
	 table, th, td {
    	border: 1px solid #bcbcbc;
    	text-align: center;
  	 }
  	 table {
  	 	margin: auto;
     	width: 600px;
  	 }/*상단 게시판 선 */
  	 hr {  	
	  	width : 600px;	  
	 }
	 
</style>

</head>
<body>
<%@ include file="/main.jsp" %>
<h3>게시판</h3>
<hr>
<form name="boardListForm" id="boardListForm">
<table>
	<tr>
		<td>번호 </td>
		<td>제목</td>
		<td>글쓴이</td>
		<td>날짜</td>
	</tr>
	
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
</table>
</form>

<!-- 검색 조건조회-->
<hr>
<form name="searchForm" id="searchForm">
<table style="text-align:center">
	<tr>
		<td>
			<select name="searchFilter" id="searchFilter">
				<option value="key_00">카테고리</option>
				<option value="key_01">제목</option>
			</select>
			<input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
			<input type="button" id="searchBtn" value="검색" />
		</td>
	</tr>	
</table>
</form>

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

		//  검색
		$(document).on("click", "#searchBtn", function(){	
			//alert("검색 버튼 클릭 :: searchBtn");
			$("#searchForm").attr({ "method":"GET","action":"boardSearchSelect"}).submit();
		});		
		
	});	

</script>

</body>
</html>