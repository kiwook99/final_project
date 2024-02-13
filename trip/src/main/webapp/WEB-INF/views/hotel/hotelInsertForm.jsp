<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>숙소 insert</title>
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
		
			
			#hotelinsertBtn {
				padding: 7px 20px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
			}
			
			#addressCheckBtn {
				padding: 6px 10px;
				background-color: #0aa4b5;
				color: white;
				border: 0;
				border-radius: 10px;
			}
			
	        #addressCheckBtn:hover, #hotelinsertBtn:hover {
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

		</style>
		
		
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d8e532a4251bcd6e33a49bd260de47d3&libraries=services"></script>
		 <script type="text/javascript">
        console.log("자바스크립트 진입 >>> : ");
        
        $(document).ready(function(){
            console.log("jQuery ready() 함수 진입 >>> : ");
            console.log(kakao.maps.services.Geocoder);
            
            $(document).on("click", "#addressCheckBtn", function(event){
                event.preventDefault();
                geocodeAddress();
            });

            $(document).on("click", "#hotelinsertBtn", function(){
                console.log("hotelinsertBtn 진입");
                alert("등록버튼");
                // 등록 버튼 눌렀을때 보냄
                // 이미지 파일 업로드시 type명은 file, 메소드는 post, enctype은 multipart/form-data
                $('#hotelInsertForm').attr({
                    'action' : 'hotelInsert',
                    'method' : 'POST',
                    'enctype' : 'multipart/form-data' 
                }).submit(); 
            });

            function geocodeAddress() {
                var address = document.getElementById('hoteladress').value;

                var geocoder = new kakao.maps.services.Geocoder();

                geocoder.addressSearch(address, function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var hotelmapx = result[0].x;
                        var hotelmapy = result[0].y;
                        
                     	// 좌표 값을 숨겨진 필드에 설정
                        $('#hotelmapx').val(hotelmapx);
                        $('#hotelmapy').val(hotelmapy);

                        // 이제 mapx와 mapy를 사용하여 필요한 작업을 수행할 수 있습니다.
                        alert("주소의 좌표값: " + hotelmapx + ", " + hotelmapy);
                    } else {
                        alert("주소를 찾을 수 없습니다.");
                    }
                });
            }
        });
    </script>	
	</head>
	<body>
	<%@ include file="/main.jsp" %>
		<br>
		<hr>
		<br>
		<h2> 숙소 등록 </h2>
		<br>
		<hr>
		<br>	
			<form name="hotelInsertForm" id="hotelInsertForm">
				<table border="1">
					<tr>
						<th class="tt" style="height:30px; width:120px;"> 숙소 이름 </th>
						<td>
							<input type="text" name="hotelname" id="hotelname" size="53">
						</td>					
						<th class="tt" rowspan="10" width="300px;">
							     
									경기도 지역 목록(지역별)<br><br>
									
									
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
									
						</th>								
					</tr>
					<tr>
						<th class="tt" style="height:30px;"> 숙소 번호 </th>
						<td>
							<input type="text" name="hoteltel" id="hoteltel" size="53">
						</td>
					</tr>
					<tr>
						<th class="tt" style="height:30px;"> 1박 요금 </th>
						<td>
							<input type="text" name="hotelprice" id="hotelprice" size="53">
						</td>
					</tr>	
					<tr>
						<th class="tt"> 숙소 소개 </th>
						<td>
							<textarea name="hotelcoment" id="hotelcoment" cols="55" rows="20"></textarea>
						</td>
					</tr>			
					<tr>
						<th class="tt" style="height:30px;"> 숙소 지역 </th>
						<td>
							<input type="text" name="regionid" id="regionid" size="53">
						</td> 
					</tr>	
					<tr>
						<th class="tt" height= "40px"> 숙소 주소 </th>
						<td>
							<input type="text" name="hoteladress" id="hoteladress" size="35" style="height:25px">
							&nbsp;
							<button id="addressCheckBtn">좌표값 생성</button> &nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<th class="tt" style="height:30px;"> 체크인 시간 </th>
						<td>
							<input type="text" name="hotelcheckin" id="hotelcheckin" size="53">
						</td>
					</tr>
					<tr>
						<th class="tt" style="height:30px;"> 체크아웃 시간 </th>
						<td>
							<input type="text" name="hotelcheckout" id="hotelcheckout" size="53">
						</td>
					</tr>
					<tr>	
						<th class="tt" style="height:40px;"> 이미지 업로드 </th>
						<td>												   
							<input type="file" name="hotelimage" id="hotelimage">
						</td>
					</tr>					
					<tr>
						<td colspan="2" align="center" style="height:53;">
							<input type="submit" value="여행지 등록" id="hotelinsertBtn" >
						</td>
					</tr>																				
				</table>
				<input type="hidden" name="hotelmapx" id="hotelmapx" value="">
				<input type="hidden" name="hotelmapy" id="hotelmapy" value="">
			</form>
			<br><br><br><br><br>			
	</body>
</html>