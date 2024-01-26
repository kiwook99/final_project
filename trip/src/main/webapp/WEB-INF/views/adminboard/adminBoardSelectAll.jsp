<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.adminBoard.vo.AdminBoardVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 : 게시판</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//alert("자바스크립트 블럭 진입 >>> : ");
			
	$(document).ready(function(){

		$(document).on("click", "#abBtn", function(){
			
			location.href="adminBoardInsertForm";
		});
			
	});	
	

</script>
 <style type="text/css">
        h3 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 60%;
            margin: 0 auto;
        }

        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        th {
            width: 30%; /* 제목 칸의 너비를 조절하여 길게 만듦 */
        }

        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h3>공지사항 글 목록</h3>
<hr>
<form name="adminboardList" id="adminboardList">
   <table>
      <thead>
          <tr>
              <td colspan="4" style="text-align:center">
                  <h3>공지사항</h3>
              </td>
          </tr>
          <tr>
              <th>글번호</th>    
              <th>제목</th>
              <th>글쓴이</th>    
              <th>날짜</th>
          </tr>
      </thead>
      <tbody>
     		 	<!-- 데이터를 출력하는 부분 -->
                <c:forEach var="board" items="${listAll}">
				    <tr>
				        <td>${board.adboardnum}</td>
				        <td>${board.adboardtitle}</td>
				        <td>${board.memnum}</td>
				        <td>${board.insertdate}</td>
				    </tr>
				</c:forEach>
                
                <tr>
                	<td colspan="5" class="right">
                	<button type="button" value="글쓰기" id="abBtn">글쓰기</button>
                	</td>
                </tr>
      </tbody>
   </table>
</form>
</body>
</html>