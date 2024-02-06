<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        input[type="text"], input[type="password"], input[type="file"] {
            width: 90%;
            padding: 8px;
        }

        textarea {
            width: 90%;
            height: 150px;
            padding: 8px;
        }

        input[type="button"] {
          
            padding: 5px 15px;
            background-color: #0aa4b5;
            color: white;
            border: 0;
            border-radius: 10px;
            cursor: pointer;
        }

    </style>

</head>
<body>
<%@ include file="/main.jsp" %>

<h3>공지사항 글쓰기</h3>
<hr>
<form name="abInsert" id="abInsert">
	<table>
	    <tr>
	        <td colspan="2" align="center"></td>
	    </tr>
	    <tr>
	        <td>글번호</td>
	        <td><input type="text" name="adboardnum" id="adboardnum" size="20" readonly></td>
	    </tr>
	    <tr>
	        <td>작성자</td>
	        <td><input type="text" name="memnum" id="memnum" size="20"></td>
	    </tr>	    
	    <tr>
	        <td>제목</td>
	        <td><input type="text" name="adboardtitle" id="adboardtitle" size="53"></td>
	    </tr>
	    <tr>
	        <td>내용</td>
	        <td><textarea name="adboardcoment" id="adboardcoment" cols="50" rows="10"></textarea></td>
	    </tr>
	    <tr>
	        <td>이미지</td>
	        <td><input type="file" name="adboardimage" id="adboardimage"></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="right">
	            <input type="button" value="등록" id="abIBtn">
	        </td>
	    </tr>
  	</table>
</form>
</body>
</html>
