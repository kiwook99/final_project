<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="take.a.trip.adminBoard.vo.AdminBoardVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#abIBtn", function(){
			console.log("abIBtn >>> : ");
			
			$('#abInsert').attr({
				'action':'adminBoardInsert',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
		
		$(document).on("click", "#abCBtn", function(e){
			location.href="adminBoardSelectAll";
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

        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        input[type="text"], input[type="password"], input[type="file"] {
            width: 90%;
            padding: 8px;
        }

        textarea {
            width: 90%;
            height: 150px;
            padding: 8px;
        }

         #abIBtn, #abCBtn {
          
            padding: 10px 30px;
            background-color: #0aa4b5;
            color: white;
            border: 0;
            border-radius: 10px;
            cursor: pointer;
        }
        
        #abIBtn:hover, #abCBtn:hover {
        	 background-color: #0bc5da;
			 transition-duration: 0.5s;
        }

    </style>

</head>
<body>
<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2> 공지사항 글쓰기 </h2>
		<br>
		<hr>
		<br>	
<form name="abInsert" id="abInsert">
	<table>
   	    <tr>
	        <th>작성자</th>
	        <td name=memid id="memid"><%= memid %></td>
	    </tr>	        
	    <tr>
	        <th>제목</th>
	        <td><input type="text" name="adboardtitle" id="adboardtitle" size="53"></td>
	    </tr>
	    <tr>
	        <th>내용</th>
	        <td><textarea name="adboardcoment" id="adboardcoment" cols="50" rows="10"></textarea></td>
	    </tr>
	    <tr>
	        <th>이미지</th>
	        <td><input type="file" name="adboardimage" id="adboardimage"></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="right">
	            <input type="button" value="등록" id="abIBtn">
	            <input type="button" value="취소" id="abCBtn">
	        </td>
	    </tr>
  	</table>
</form>
<br><br><br>
</body>
</html>
