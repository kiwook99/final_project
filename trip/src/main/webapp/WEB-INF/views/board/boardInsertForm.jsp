<!-- 데이터입력 html, form-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//alert("자바스크립트 블럭 진입 >> : ");
	
	$(document).ready(function(){
		
		//alert("jQuery ready()함수 블럭 진입 >> : ");
		
		$(document).on("click", "#bBtn", function(){
			console.log("kbBtn >> : ");
			
			$('#fileuploadForm').attr({
				'action':'fileupload',
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

</style>

</head>

<body>
<%@ include file="/main.jsp" %>
<%
	//Object obj = request.getAttribute("memnum");
	//String memnum = String.valueOf(obj);
%>
<h3> 게시글 작성</h3>
<hr>
<form name="fileuploadForm" id="fileuploadForm">

<table border="1" align="center">
	
	<tr>
		<td><input type="text" name="memnum" id="memnum" size="20" placeholder="닉네임" value="<%= memid %>"></td>
	</tr>
	
	<tr>
		<td><input type="text" name="boardtitle" id="boardtitle" size="50" placeholder="제목"></td>
	</tr>	
	
	<tr>
		<td>			
			<textarea name="boardcoment" id="boardcoment" rows="20" cols="80" placeholder="내용을 입력해주세요"></textarea>
		</td>
	</tr>	
	
	<tr align=left>
		<!-- <input>태그: 사용자로부터 입력을 받을 수 있는 입력 필드(input filed)를 정의할 때 사용-->
	    <td><input type="file" id="boardimage" name="boardimage"></td>	  
	</tr>
	
	<tr>
		<td align="right">				
			<input type="button" id="bBtn" value="등록">
			<input type="reset" value="취소">	
		</td>
	</tr>
	
</table>
</form>
</body>
</html>