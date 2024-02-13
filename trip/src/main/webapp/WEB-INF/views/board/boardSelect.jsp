<%-- 조건조회  html, form태그 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="take.a.trip.board.vo.BoardVO"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	h3 {
		text-align: center;
	}
	
	table {
	    width:600px; 
	    margin: auto;
	}
	
	table, td, th {
	    border-collapse : collapse;
	    border : 1px solid black;
	};
	.img_div {
		margin: auto;
		height: 500px;
		width: 600px;
		text-align: center;
	}
	.text_div {
		height: 80px;
		width: 600px;
	}
	
	img {
	    margin: auto;
	    display: block;
	}
</style>
</head>
<body>
<%@ include file="/main.jsp" %>
<h3>게시글</h3>
<hr>
<% 
	Object adj = request.getAttribute("adminyn");
	boolean adbool = adj.equals("Y");
	Object obj = request.getAttribute("listS");
	if (obj == null) {return; }
	
	List<BoardVO> list =(List<BoardVO>)obj;
	//if (list.size() == 1){
		BoardVO bvo = list.get(0);		
%>

<form name="fileuploadForm" id="fileuploadForm">
<table>
	<!--style="border:none":입력창 모서리 없애기-->
	<tr>
		<td>제목 : <input type="text" name="boardtitle" value="<%=bvo.getBoardtitle()%>" style="border:none"></td>
	</tr>	
	
	<tr>		
		<td>글쓴이 : <input type="text" name="memnum" value="<%=bvo.getMemnum()%>"  style="border:none"></td>
	</tr>
	
	<tr>
		<td>
			<div class="img_div">					
				<img src="${pageContext.request.contextPath}/resources/fileupload/board/<%= bvo.getBoardimage() %>" />
			</div>
			<hr>
			<div class="text_div">	
				<%=  bvo.getBoardcoment()%>
			</div>
		</td>
	</tr>
	<!-- 버튼 -->	
	<tr>
		<td style="text-align:right">
		<% if(adbool) { %> 			
			<input type="button" id="bUBtn" value="수정">
			<input type="button" id="bDBtn" value="삭제">
			<input type="button" id="bWBtn" value="등록">
		<% } %>		
		</td>
	</tr>
	
</table>
</form>		
<%		
	//}
%>
</body>
<!-- 댓글 처리 하는 루틴  -->  

<jsp:include page="./reviewForm.jsp">
	<jsp:param value="<%=bvo.getMemnum()%>" name="memnum"/>
</jsp:include>

</html>