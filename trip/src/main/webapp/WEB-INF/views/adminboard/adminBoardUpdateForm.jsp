<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.adminBoard.vo.AdminBoardVO" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Object obj = request.getAttribute("listU");
	if (obj == null) return;

	List<AdminBoardVO> list = (List<AdminBoardVO>)obj;	
	int nCnt = list.size();
	
	AdminBoardVO _abvo = null;
	if (nCnt == 1){
		_abvo = list.get(0);
	}	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"> 

	$(document).ready(function(){
		//  취소
		$(document).on("click", "#ccBtn", function(e){
			alert("취소");
			e.preventDefault();
			$("#adBoardUpdate").attr({ "method":"GET", "action":"adminBoardSelectAll"}).submit();
			//location.href="adminBoardSelect";
		});	
		
		// U
		$(document).on("click", "#abbUpdateBtn", function(e){
			alert("수정하기");
			e.preventDefault();
			$("#adBoardUpdate").attr({ "method":"GET", "action":"adminBoardUpdate"}).submit();
		});
	});
	

</script>
<style type="text/css">

        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin: 0 auto;
        }

        th, td {
            border: 1px solid black;
            padding: 5px;
            /*text-align: center;*/
        }
        
        td {
            border: 1px solid black;
            padding: 10px;
        }
        
         /* 텍스트 박스 스타일 */
	    textarea {
	        width: 100%; /* 테이블의 100% 크기로 조절 */
	        box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 크기로 설정 */
	        
	    }
	    
	    .mem {
		    text-align: left;
		    display: inline-block;
		}
		
		.imgs img {
	        max-width: 100%; /* 이미지가 부모 요소를 넘어가지 않도록 최대 너비 설정 */
	        height: auto; /* 높이는 자동으로 조절 */
	        display: block; /* 인라인 요소에서 블록 요소로 변환하여 가로로 정렬 */
	        margin: auto;
	    }

        button {
           padding: 5px 15px;
           background-color: #0aa4b5;
           color: white;
           border: 0;
		   border-radius: 10px;
           cursor: pointer;
           display: flex; /* 버튼을 블록 요소로 변경 */
       	   float: right; /* 오른쪽으로 이동 */
        }
        
        .right button {
		    margin-right: 10px;
		}
		
		
        button:hover {
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
		<h2> 공지사항 </h2>
		<br>
		<hr>
		<br>
<form name="adBoardUpdate" id="adBoardUpdate">
<table>
<tr>
<td colspan="2" align="center" style="color:white; background-color:#0aa4b5;">공지사항 수정하기</td>
</tr>

<input type="hidden" class="mem" name="adboardnum" id="adboardnum" value="<%= _abvo.getAdboardnum() %>"/>

<tr>
<td>제목</td>
<td>
<input type="text" class="mem" name="adboardtitle" id="adboardtitle" value="<%= _abvo.getAdboardtitle() %>" 
			style="width:100%; height:30px; font-size:16px;"/>
</td>
</tr>
<tr>
<td>작성자</td>
<td><input type="text" class="mem" name="memnum" id="memnum" value="<%=  _abvo.getMemnum() %>" 
			style="width:100%; height:30px; font-size:16px;" readonly/></td>
</tr>
<tr>
<td>내용</td>
<td>
<textarea name="adboardcoment" id="adboardcoment" cols="70" rows="10" style="font-size: 18px;"><%= _abvo.getAdboardcoment() %>					
</textarea>
</td>
</tr>
<tr>
<td>사진</td>
<td class="imgs"> 
<img src="${pageContext.request.contextPath}/resources/fileupload/adminboard/<%= _abvo.getAdboardimage() %>" 
			border="1" width="300" height="200" alt="image">
</td>
</tr>
<tr>
<td>등록일</td>
<td>
<input type="text" class="mem" name="insertdate" id="insertdate" value="<%= _abvo.getInsertdate() %>" 
		style="width:100%; height:30px; font-size:16px;" readonly />		      
</td>
</tr>	 
<tr>
<td>수정일</td>
<td> 
<input type="text" class="mem" name="updatedate" id="updatedate" value="<%= _abvo.getUpdatedate() %>" 
		style="width:100%; height:30px; font-size:16px;" readonly />		      
</td>
</tr>
<tr>
	<td colspan="5" class="right">
	<button type="button" value="취소" id="ccBtn">취소</button>
	<button type="button" value="수정" id="abbUpdateBtn">수정하기</button>
    </td>      	
</tr>
</table>
</form>
<br><br><br>
</body>
</html>