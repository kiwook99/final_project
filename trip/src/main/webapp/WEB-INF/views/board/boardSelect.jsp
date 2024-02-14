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
	
	h2 {
		text-align: center;
	}
	
	       #post {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
        }

       #post th, #post td {
            border: 1px solid black;
            padding:5px;
/*             text-align: center; */
        }
        
       #post td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        
         /* 텍스트 박스 스타일 */
	   #post textarea {
	        width: 100%; /* 테이블의 100% 크기로 조절 */
	        box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 크기로 설정 */
	    }	
	

			#bUBtn, #bDBtn, #bWBtn, #bCBtn {
			padding: 5px 25px;
			background-color: #0aa4b5;
			color: white;
			border: 0;
			border-radius: 10px;
			font-size: 15px;
			}
			
			
			#bUBtn:hover, #bDBtn:hover, #bWBtn:hover, #bCBtn:hover {
        	 background-color: #0bc5da;
			 transition-duration: 0.5s;
			}
			
		.tt {
			 text-align: center;
			 font-size: 20px;
			 
		}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//  U	
		$(document).on("click", "#bUBtn", function(e){
			
			e.preventDefault();
			$("#adBoardSelect").attr({ "method":"GET", "action":"adminBoardUpdateForm"}).submit();
		});
		
		// D
		$(document).on("click", "#bDBtn", function(e){
			alert("삭제하기");
			e.preventDefault();
			$("#adBoardSelect").attr({ "method":"GET", "action":"adminBoardDelete"}).submit();
		});
		
		$(document).on("click", "#bCBtn", function(e){
			location.href="boardSelectAll";
		});
	});
	

</script>
</head>
<body>
<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2> 게시글 </h2>
		<br>
		<hr>
		<br>	
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
<table id="post" border="1">
<tr>
    <td colspan="5" style="text-align:center;color:white; background-color:#0aa4b5;">
        <h3>게시글</h3>
    </td>
</tr>
	<!--style="border:none":입력창 모서리 없애기-->
	<tr>
		<th  style="width:80px;">제목 </th>
		<td class="tt"  style="width:100px; height:30px; text-align: center;"><%=bvo.getBoardtitle()%> </td>
	</tr>	
	
	<tr>	
		<th>글쓴이 </th>	
		<td class="tt" style="text-align: center;"><%=bvo.getMemnum()%> </td>
	</tr>
	<tr>
		<th>사진 </th>
		<td class="tt" style="text-align: center;">
				<img src="${pageContext.request.contextPath}/resources/fileupload/board/<%= bvo.getBoardimage() %>" width="300" height="200" alt="image"/>
		</td>
	</tr>
	<tr>
		<th>내용 </th>	
		<td  class="tt" style="text-align: center;">
			<div class="text_div">	
				<%=  bvo.getBoardcoment()%>
			</div>
		</td>
	</tr> 
	<!-- 버튼 -->	
	<tr>
		
		<td style="text-align:right" colspan="2">
		<% if ("Y".equals(adj)) { %>			
			<input type="button" id="bUBtn" value="수정"/>
			<input type="button" id="bDBtn" value="삭제"/>
		<% } %>		
		<input type="button" value="돌아가기" id="bCBtn" />
		</td>
	</tr>
	
</table>
</form>		
<%		
	//}
%>
<br><br><br>
</body>
<!-- 댓글 처리 하는 루틴  -->  

<jsp:include page="./reviewForm.jsp">
	<jsp:param value="<%=bvo.getMemnum()%>" name="memnum"/>
</jsp:include>

</html>