<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="take.a.trip.review.vo.ReviewVO" %> 
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="take.a.trip.T_Session" %>

<% 
//T_Session 객체 생성
T_Session tSession = T_Session.getInstance();

//HttpServletRequest 객체를 사용하여 세션 가져오기
HttpServletRequest httpServletRequest = (HttpServletRequest) pageContext.getRequest();
String memid = tSession.getSession(httpServletRequest);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("reviewForm.jsp 페이지 >>> : ");

	// 게시글 페이지에서 memnum 변수 받아오는 루틴 : 지우면 안됨
	String memnum = request.getParameter("memnum");
	// memnum = "aaa";//memnum = "B0004";
	logger.info("rboardForm.jsp memnum >>> : " );
%>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//rkbcontent 길이 제한 200byte
		$("#rkbcontent").keyup(function(){
			cut_200(this);
		});
		
		// 댓글 전체 불러오기 
		selectAll();
		
		// 댓글 등록
		$(document).on("click", "#insertbtn", function(){
			console.log("insertbtn >>> : ");
			
			let insertURL = "<%= request.getContextPath() %>/review/reviewInsert";		
			let method = "POST";
			let dataParam = {
				bnum: $("#memnum").val(),
				bname: $("#tripnum").val(),
				bcontent: $("#breviewcoment").val(),
			};
			dataParam = $("#reviewForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: insertURL,
				type: method,
				data: dataParam,				
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				
				if ("GOOD" == resData){
					// 입력데이터 초기화 함수호출 
					reviewFormData();
					location.reload();
					selectAll();
				}
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
			
			// selectAll();
		});
		
		// 댓글 삭제		
		$(document).on("click", ".deleteBtn", function(){
			console.log("D >>> : ");
			
			var rbnumV = $(this).parents("li").attr("dataNum");
			
			var target = $(this).parents(".rbmemoItem");
			console.log("target >>> : " + target);
			
			let deleteURL = "<%= request.getContextPath() %>/review/reviewDelete";
			let method = "POST";
			let dataParam = {
					breviewnum: $('#breviewnum').val(rbnumV),				
			};		
			dataParam = $("#reviewForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: deleteURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){					
				console.log("resData >>> : " + resData);				
				if ("GOOD" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}	
			}
			function whenError(e){
				console.log("e >>> : " + e.responseText);
			}
		});
	});
	
	
	// 게시글 번호로 댓글 전체조회 ============================================
	function selectAll(){
					
		console.log("SALL >>> : ");
		
		let selectAllURL = "<%= request.getContextPath() %>/review/reviewSelectAll";
		let method = "POST";
		let dataParam = {
			bnum: $("#memnum").val(),				
		};		
		dataParam = $("#reviewForm").serialize();
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: selectAllURL,
			type: method,
			data: dataParam,			
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){	
			console.log("resData >>> : " + resData);
			console.log("whenSuccess rboardSelectAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
					
			let v = resData.split("&");
			for(let i=0; i < v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j=0
				for (; j < vv.length-1; j++){
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
	// 게시글 번호로 댓글 전체조회 ============================================
		
	//새로운 글 화면에 추가	=================================================
	function addNewItem(num, writer, content, datetime){
		
		//데이터 체크
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
		dateSpan.html(" / " + datetime + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		// 삭제 버튼 
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"삭제하기"});
		delInput.addClass("deleteBtn");
		// 내용
		var contentP = $("<p>");
		contentP.html(decodeURIComponent(content.replace(/\+/g, " ")));
		
		// 조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP);
		$("#reviewlist").append(newLi);
	}
	// 새로운 글 화면에 추가	=================================================
	
	// 댓글 길이 체크  ========================================================
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
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
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	// 댓글 길이 체크  ========================================================
	
	//댓글 등록 후 입력창 초기화
	function reviewFormData(){
		$("#tripnum").val("");
		$("#breviewcoment").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}

</script>

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
		

			#comment {
			    border: none;
			}
</style>
</head>
<body>
<hr>
<br>
<h2 style="text-align:center">덧글</h2>
<br>
<hr>
<br><br>
<form name="reviewForm" id="reviewForm">
<div class="reviewlist">
<ol name="reviewlist" id="reviewlist">

	<!-- 여기에 동적 생성 요소가 들어온다. -->
</ol>
</div>
<hr>
<br>
<table id="comment" >
<tr>
	<td style="width:120px;">작성자</td>
	<td>
		<input type="text" name="tripnum" id="tripnum" value=<%=memid%> size="40" style="height: 25px;" readonly />
		<input type="hidden" name="memnum" id="memnum" value="<%=memnum%>">
		<input type="hidden" name="breviewnum" id="breviewnum">
	    <input type="button" value="저장하기" id="insertbtn">
	</td>
</tr>
<tr>
<td colspan="2" style="height:20px;"></td>
</tr>
<tr>
	<td>덧글 내용</td>
	<td>
		
		<textarea name="breviewcoment" id="breviewcoment" rows="5" cols="50" style="resize: none"></textarea>	
		<div style="text-align: center;"><span class="bytes">0</span>  bytes</div>
	</td>
</tr>
</table>
</form>
<br><br>
</body>
</html>