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
	
	h2 {
		text-align: center;
	}
	
	
		#bBtn {
		padding: 5px 15px;
		background-color: #0aa4b5;
		color: white;
		border: 0;
		border-radius: 10px;
	}
		
	#bBtn:hover {
	  background-color: #0bc5da;
	  transition-duration: 0.5s;
	}				
	 
	
	        input[type=file]::file-selector-button {
	    			padding: 5px 15px;
		background-color: #0aa4b5;
		color: white;
		border: 0;
		border-radius: 10px;
	        }	
	        
	        input[type=file]::file-selector-button:hover {
	  background-color: #0bc5da;
	  transition-duration: 0.5s;
	        }  
	
	
	        input[type=reset] {
	    			padding: 5px 15px;
		background-color: #0aa4b5;
		color: white;
		border: 0;
		border-radius: 10px;
	        }	
	        
	        input[type=reset]:hover {
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
		<h2> 게시글 작성</h2>
		<br>
		<hr>
		<br>

<form name="fileuploadForm" id="fileuploadForm">

<table border="1" align="center">
	
	<tr>
		<th width="80px;" height="30px;">작성자 </th>
		<td>
		<input type="text" name="memnum" id="memnum" size="50" placeholder="닉네임" value="<%= memid %>">
		</td>
	</tr>
	
	<tr>
	
		<th  height="30px;">제목 </th>
		<td>
		<input type="text" name="boardtitle" id="boardtitle" size="70" placeholder="제목">
		</td>
	</tr>	
	
	<tr>
		<th>내용 </th>	
		<td>			
			<textarea name="boardcoment" id="boardcoment" rows="20" cols="80" placeholder="내용을 입력해주세요"></textarea>
		</td>
	</tr>	
	
	<tr align=left>
		<th style="text-align:center; height:50px;">이미지 </th>		
		<!-- <input>태그: 사용자로부터 입력을 받을 수 있는 입력 필드(input filed)를 정의할 때 사용-->
	    <td>&nbsp;&nbsp;&nbsp;<input type="file" id="boardimage" name="boardimage"></td>	  
	</tr>
	
	<tr>
		<td align="right" colspan="2"  height="50px;">				
			<input type="button" id="bBtn" value="등록">
			<input type="reset" value="취소">	&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	
</table>
</form>
</body>
</html>