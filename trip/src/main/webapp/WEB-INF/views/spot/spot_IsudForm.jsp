<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>경기도 관광지 ISUD</title>
		<style type="text/css">
			table {
				margin: 0 auto;
				border-radius: 5px;
			}
			
			h2 {
				text-align: center;
			}
			
			.tt {
				text-align: center;
			}

			.ti {
				text-align: left;
			}
			
		
			
			#spot_isud_insertBtn {
				padding: 5px 15px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
			}
						
		</style>
		
		
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
			console.log("자바스크립트 진입 >>> : ");
			
			$(document).ready(function(){
				console.log("jQuery ready() 함수 진입 >>> : ");
				
				$(document).on("click", "#spot_isud_insertBtn", function(){
					console.log("spot_isud_insertBtn >>> : ");
					
					// 등록 버튼 눌렀을때 보냄
					// 이미지 파일 업로드시 type명은 file, 메소드는 post, enctype은 multipart/form-data
					$('#spot_IsudForm').attr({
						'action' : 'spot_IsudInsert',
						'method' : 'POST',
						'enctype' : 'multipart/form-data' 
					}).submit(); 
				});
			});
			
		</script>		
	</head>
	<body>
	<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2> 여행지 등록</h2>
		<br>
		<hr>
		<br>	
			<form name="spot_IsudForm" id="spot_IsudForm">
				<table border="1">
					<tr>
						<td class="tt" width="120px"> 여행지 번호 </td>
						<td class="ti">
							<input type="text" name="tripnum" id="tripnum" size="40" placeholder="자동으로 들어갑니다." readonly >
						</td>					
						<td class="tt" rowspan="7" width="300px;">
							     
									경기도 지역 목록(지역별)<br>
									<br>
									
									1.	가평군 &nbsp;	2.	고양시 &nbsp;	3.	과천시 <br><br>
									4.	광명시 &nbsp;	5.	광주시 &nbsp;	6.	구리시 <br><br>
									7.	군포시 &nbsp;	8.	김포시 &nbsp;	9.	남양주시<br><br>
									10.	동두천시 &nbsp;	11.	부천시 &nbsp;	12.	성남시  <br><br>
									13.	수원시 &nbsp;	14.	시흥시 &nbsp;	15.	안산시 <br><br>
									16.	안성시 &nbsp;	17.	안양시 &nbsp;	18.	양주시 <br><br>
									19.	양평군 &nbsp;	20.	여주시 &nbsp;	21.	연천군 <br><br>
									22.	오산시 &nbsp;	23.	용인시 &nbsp;	24.	의왕시<br><br>
									25.	의정부시 &nbsp;	26.	이천시 &nbsp;	27.	파주시  <br><br>
									28.	평택시 &nbsp;	29.	포천시 &nbsp;	30.	하남시 <br><br>
									31.	화성시
									
						</td>	
						<td class="tt" id="tc" rowspan="7" width="200px;">
							     <br><br><br><br><br>
									여행지 카테고리(분야별)<br>
									<br>
									
									1. 관광지<br><br>
									2. 문화시설<br><br>
									3. 축제공연행사<br><br>
									4. 레포츠<br><br>
									5. 음식점<br><br><br><br><br><br><br>					
						</td>												
					</tr>
					<tr>
						<td class="tt"> 여행지 이름 </td>
						<td class="ti">
							<input type="text" name="tripname" id="tripname" size="40">
						</td>
					</tr>
					<tr>
						<td class="tt"> 카테고리 </td>
						<td class="ti">
							<input type="text" name="tripcatalogue" id="tripcatalogue" size="40">
						</td>
					</tr>	
					<tr>
						<td class="tt"> 여행지 소개 </td>
						<td class="ti">
							<textarea name="tripcoment" id="tripcoment" cols="42" rows="25"></textarea>
						</td>
					</tr>			
					<tr>
						<td class="tt"> 지역 </td>
						<td class="ti">
							<input type="text" name="tripregion" id="tripregion" size="40">
						</td>
					</tr>	
					<tr>	
						<td class="tt" id="tf" height= "40px"> 이미지 </td>
						<td>												   
							<input type="file" name="tripimage" id="tripimage">
						</td>
					</tr>					
					
					<tr>
						<td colspan="2" align="center" height="50px">
							<input type="submit" value="여행지 등록" id="spot_isud_insertBtn" >
						</td>
					</tr>			
																						
				</table>
			</form>
			<br><br><br><br><br>
	</body>
</html>