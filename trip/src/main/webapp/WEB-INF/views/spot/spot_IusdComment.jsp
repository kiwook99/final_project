<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 스타일 -->
		<style type="text/css">
			h2 {
				text-align: center;
				margin-left: 10px;
			}
			
			#insertbtn {
				padding: 10px 25px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
				font-size: 15px;
			}
			
			.deleteBtn {
			    padding: 5px 15px;
			    background-color: #0aa4b5;
			    color: white;
			    border: 0;
			    border-radius: 10px;
			    font-size: 15px;
			}
			
			.name {
				font-weight: bold;
			}
			
			#commentlist {
				margin-left: 45px;
			}
			
			#insertbtn:hover, .deleteBtn:hover {
        	 background-color: #0bc5da;
			 transition-duration: 0.5s;
			}			
			

		</style>
		
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				console.log("자바스크립트 진입 >>> : ");
				
				// 덧글 길이 제한
				$('#reviewcoment').keyup(function(){
					cut_200(this);
				});
				
				// 댓글 전체 불러오기
				selectAll();
				
				// 댓글 등록
				$(document).on("click", "#insertbtn", function(){
					console.log("insertbtn >>> : ");
					
					let insertURL = "spot_IsudCommentInsert";
					let method = "POST";
					let dataParam = {
							tripnum: $('#tripnum').val(),
							memnum: $('#memnum').val(),
							reviewcoment: $('#reviewcoment').val()
					};
					dataParam = $("#commentForm").serialize();
					console.log("dataParam : " + dataParam);
					
					$.ajax({
						url: insertURL,
						type: method,
						data: dataParam,
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success: whenSuccess,
						error: whenError
					});
					
					function whenSuccess(resData){

						if ("GOOD" == resData){
							// 입력데이터 초기화 함수호출
							rboardFormData();
							location.reload();
							selectAll();
						}
					}
					function whenError(e){
						alert("e >>> : " + e.responseText);
					}
					selectAll();
				});
				
				// 댓글 삭제
				$(document).on("click", ".deleteBtn", function(){
					console.log("D >>> : ");
					
					var rbnumV = $(this).parents("li").attr("dataNum");

					var target = $(this).parents(".rbmemoItem");
					console.log("target >>> : " + target);
					
					let deleteURL = "spot_IsudCommentDelete";
					let method = "POST";
					let dataParam = { reviewnum: $('#reviewnum').val(rbnumV) };  // 댓글 번호 기준으로 삭제함
					
					
					dataParam = $('#commentForm').serialize();
					console.log("dataParam >>> : " + dataParam);
					
					$.ajax({
						url: deleteURL,
						type: method,
						data: dataParam,
						success: whenSuccess,
						error: whenError,
					});
					
					function whenSuccess(resData){
						console.log("resData >>> : " + resData);
						if("GOOD" == resData){
							alert("댓글이 삭제되었습니다.");
							target.remove();
						}
					}
					function whenError(e){
						console.log("e >>> : " + e.responseText);
					}
				});		
			});
		
		// 게시글 번호로 댓글 전체조회 
		function selectAll(){
			
			console.log("selectAll >>> : ");
			
			let selectAllURL = "spot_IsudCommentSelectAll";
			let method = "POST";
			let dataParam = { tripnum: $("#tripnum").val()};
			
			dataParam = $('#commentForm').serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: selectAllURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError,
			});
			
			function whenSuccess(resData){
				console.log("resData >>> : " + resData);
				
				
				if(isEmpty(resData)){
					return false;
				}
				
				let v = resData.split("&");
				for(let i = 0; i < v.length; i++){
					console.log(v[i]);
					
					let vv = v[i].split(",");
					let j = 0;
					for(; j < vv.length - 1; j++){
						console.log("vv[0] >>> : " + vv[0]);
						console.log("vv[1] >>> : " + vv[1]);
						console.log("vv[2] >>> : " + vv[2]);
						console.log("vv[3] >>> : " + vv[3]);
					}
					addNewItem(vv[0], vv[1], vv[2], vv[3]);
				}
			}
			function whenError(e){
				console.log("e >>> : " + e.responseText);
			}
		}
		
		// 새로운 글 화면에 추가
		function addNewItem(num, writer, content, datetime){
			
			// 데이터 체크
			if(isEmpty(num)) return false;
			
			// 새로운 글이 추가될 li태그
			var newLi = $("<li>");
			newLi.attr("dataNum", num);
			newLi.addClass("rbmemoItem");
			
			// 작성자 정보가 지정될 <p> 태그
			var writerP = $("<p>");
			writerP.addClass("writer");
			
			
			
			// 작성자 정보의 이름
			var nameSpan = $("<span>");
			nameSpan.addClass("name");
			nameSpan.html(decodeURIComponent(writer) + " 님");
			
			// 작성일시
			var dateSpan = $("<span>");
			dateSpan.html(" / " + datetime + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
			
			// 삭제 버튼
			var delInput = $("<input>");
			delInput.attr({"type":"button", "value":"삭제하기"});
			delInput.addClass("deleteBtn");
			
			//내용
			var contentP = $("<p>");
			contentP.html(decodeURIComponent(content));
			
			// 조립하기
			writerP.append(nameSpan).append(dateSpan).append(delInput);
			newLi.append(writerP).append(contentP);
			$("#commentlist").append(newLi);
			}
		
		// 댓글 길이 체크
		// 한글 포함 문자열 길이
		function getTextLength(s){
			var len = 0;
			for(var i = 0; i < s.length; i++){
				if(escape(s.charAt(i)).length == 6){
					len++;
				}
				len++;
			}
			return len;
		}
		
		function cut_200(obj){
			var t = $(obj).val();
			var l = t.length;
			while(getTextLength(t) > 200){
				l--;
				t = t.substring(0, l);
			}
			$(obj).val(t);
		}
		
		// 댓글 등록 후 입력창 초기화
		function rboardFormData(){
			$("#memnum").val("");
			$("#reviewcoment").val("");
		}
		
		// 데이터 체크
		function isEmpty(val){
			if(typeof val=="undefined" || val == null || val == ""){
				return true;
			}else{
				return false;
			}
		}
		</script>
	</head>
	<body>
		<br><br>
		<hr>
		<br>
		<h2>리뷰</h2>
		<br>
		<hr>
<% request.setCharacterEncoding("utf-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("spot_IusdComment.jsp 페이지 >>> : ");
	
	String tripnum = request.getParameter("tripnum");
	logger.info("spot_IusdComment tripnum 페이지 >>> : " + tripnum);
%>
		<form name="commentForm" id="commentForm">
			<div>
				<ol name="commentlist" id="commentlist">
				<!-- 입력한 값이 들어갈 것임 -->
				</ol>
			</div>
			<hr>
			<br>
			<table>
				<tr>
					<td style="width:120px;">작성자</td>
					<td>
						<input type="text" name="memnum" id="memnum"  size="40" style="height: 25px;"/>
						<input type="hidden" name="tripnum" id="tripnum" value="<%= tripnum %>">
						<input type="hidden" name="reviewnum" id="reviewnum" >
						<input type="button" value="저장" id="insertbtn" >
					</td>
				</tr>
				<tr>
				<td colspan="2" style="height:20px;"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="reviewcoment" id="reviewcoment" rows="5" cols="60" style="margin-right:35px"></textarea>
					</td>
				</tr>
			</table>
		</form>
		<br><br>
	</body>
</html>