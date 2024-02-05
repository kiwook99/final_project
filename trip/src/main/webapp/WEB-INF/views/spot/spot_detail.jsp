<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.log4j.LogManager"%>

<% request.setCharacterEncoding("UTF-8");%>	
<% Logger logger = LogManager.getLogger(this.getClass()); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>경기도 관광지</title>
		
		<!-- 스타일 -->
		<style type="text/css">
 		
		</style>
		
		
		<!-- 자바 스크립트 & 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
		// 맨 처음 화면 시작할때 작동
		$(document).ready(function() {
			console.log("jQuery 진입 >>> : ");
			
			// 현재 URL에서 contentid 추출
		    var contentid = window.location.href.split('/').pop();
			
			spot_detail(contentid); // spot(contentid) 함수 실행
		});
		
		// gyeonggi_spot.py에서 contentid의 값을 받아 매개변수에 넣어줌
		function spot_detail(contentid) {
			console.log("spot 함수 진입 >>> : ");
			 
			// 공통정보 ajax 시작
			$.ajax({ 
				type: 'GET', 
				url: "http://127.0.0.1:5001/api_spot_detail_1/spot_detail_1", // url : flask, blueprint 참고, flask api 엔드 포인트
		        data: { contentid: contentid }, // contentid 전달
				dataType: 'JSON', // 데이터 타입
				success : function(item_list) { // 성공할 시 실행되는 콜백 함수
					console.log("ajax 진입 >>> : ");

					// flask에서 받아온 데이터를 for를 통해서 출력
					for(var i = 0; i < item_list.length; i++){
						// 제목
						var title = item_list[i].title;
						console.log("제목 >>> : " + title);						
						// 홈페이지 
						var homepage = item_list[i].homepage;
						console.log("홈페이지 >>> : " + homepage);
						// 주소
						var addr1 = item_list[i].addr1;
						console.log("주소 >>> : " + addr1);
						// x좌표(경도)
						var longtitue  = item_list[i].mapx;
						console.log("x좌표(경도) >>> : " + longtitue);
						// y좌표(위도)
						var lattitue  = item_list[i].mapy;
						console.log("y좌표(위도) >>> : " + lattitue);
						// 지도 level
						var mlevel = item_list[i].mlevel;
						console.log("지도 level >>> : " + mlevel);
						// 상세설명
						var overview = item_list[i].overview;
						console.log("상세설명 >>> : " + overview);
						// 이미지
						var firstimage = item_list[i].firstimage;
						console.log("이미지 >>> : " + firstimage);						
					
					// ===================================================
						
					// 제목 데이터 삽입
                    var title_name = '<h4>' + title + '</h4>';
                    $('#title_name').html(title_name);
                  
                    // 주소 데이터 선언
                    var addr = '<li>' + 
                    		   '<strong>' + "주소 " + '</strong>' + 
                    		   '<span class="addr1">' + addr1 + '</span>' +   
                    		   '</li>';
                    //$('#spotList_detail_1').html(addr);                    
                    
                    // 홈페이지 데이터 선언
                    var homepage = '<li>' + 
                    		   '<strong>' + "홈페이지 " + '</strong>' + 
                    		   '<span class="homepage">' + homepage + '</span>' +  
                    		   '</li>';
                    //$('#spotList_detail_1').html(homepage);
                    //$('#spotList_detail_1').html(addr + homepage);
                    
					// 합치기                    
                   	var spotList_detail_1 = addr + homepage;
					// 공통 정보 데이터 삽입
 					$('#spotList_detail_1').html(spotList_detail_1);
                    
					
					// 상세설명 데이터 삽입
 					var overview = '<span>'  + overview + '</span>';
                    
                    
   					$('#overview').html(overview);

 					
                    // 이미지 삽입
                    var firstimage = '<img src="' + firstimage + '">';
                    $('#img').html(firstimage);
   					
   					
   					
 					// 지도 (위도, 경도) 데이터 삽입
 					var maps = viewmap(lattitue, longtitue, title);
 					$('#map').html(maps);
 					

                    console.log(location.origin);    
                    
                    // 추가정보 함수 실행
                    spot_detail_2(contentid);             
						}
					
				},
				// 에러 발생시 실행되는 콜백 함수
				error : function(xtr, status, error) {
						alert(xtr + ":" + status + ":" + error);
						console.log("location.origin error >>> : " + location.origin); // url 값
				}
			});
			
		}		
				

		// gyeonggi_spot.py에서 contentid의 값을 받아 매개변수에 넣어줌
		function spot_detail_2(contentid) {
			console.log("spot 함수 진입 >>> : ");
			 
			// 공통정보 ajax 시작
			$.ajax({ 
				type: 'GET', 
				url: "http://127.0.0.1:5001/api_spot_detail_2/spot_detail_2", // url : flask, blueprint 참고, flask api 엔드 포인트
		        data: { contentid: contentid }, // contentid 전달
				dataType: 'JSON', // 데이터 타입
				success : function(item_list) { // 성공할 시 실행되는 콜백 함수
					console.log("ajax 진입 >>> : ");

					// flask에서 받아온 데이터를 for를 통해서 출력
					for(var i = 0; i < item_list.length; i++){
						// 전화번호
						var infocenter = item_list[i].infocenter;
						console.log("전화번호 >>> : " + infocenter);						
						// 쉬는날 
						var restdate = item_list[i].restdate;
						console.log("쉬는날 >>> : " + restdate);
						// 체험안내
						var expguide = item_list[i].expguide;
						console.log("체험안내 >>> : " + expguide);
						// 체험가능 연령
						var expagerange  = item_list[i].expagerange;
						console.log("체험가능 연령 >>> : " + expagerange);
						// 이용시간
						var usetime  = item_list[i].usetime;
						console.log("이용시간 >>> : " + usetime);
						// 주차시설
						var parking = item_list[i].parking;
						console.log("주차시설 >>> : " + parking);
						// 유모차 대여정보
						var chkbabycarriage = item_list[i].chkbabycarriage;
						console.log("유모차 대여정보 >>> : " + chkbabycarriage);
						// 애완동물동반가능정보
						var chkpet = item_list[i].chkpet;
						console.log("애완동물동반가능정보 >>> : " + chkpet);
						// 신용카드가능정보
						var chkcreditcard = item_list[i].chkcreditcard;
						console.log("신용카드가능정보 >>> : " + chkcreditcard);

					// ===================================================
						
                  
                    // 전화번호
                    var infocenter = '<li>' + 
                    		   '<strong>' + "문의전화 " + '</strong>' + 
                    		   '<span class="infocenter">' + infocenter + '</span>' +   
                    		   '</li>';
                    $('#spotList_detail_1').append(infocenter);                    
                    

				// 추가정보
					
					// 이용시간
					var usetime = '<li>' + 
				         		  '<strong>' + "이용시간 " + '</strong>' + 
				        		  '<span class="usetime">' + usetime + '</span>' +   
				        		  '</li>';
					// 휴무일
					var restdate = '<li>' + 
				         		  '<strong>' + "휴무일 " + '</strong>' + 
				        		  '<span class="restdate">' + restdate + '</span>' +   
				        		  '</li>';					
					// 주차시설
					var parking = '<li>' + 
				         		  '<strong>' + "주차시설 " + '</strong>' + 
				        		  '<span class="parking">' + parking + '</span>' +   
				        		  '</li>';						
					
					// 체험가능 연령
					var expagerange = '<li>' + 
				         		  '<strong>' + "체험가능 연령 " + '</strong>' + 
				        		  '<span class="expagerange">' + expagerange + '</span>' +   
				        		  '</li>';						
					
					// 체험안내
					var expguide = '<li>' + 
				         		  '<strong>' + "체험안내 " + '</strong>' + 
				        		  '<span class="expguide">' + expguide + '</span>' +   
				        		  '</li>';						

 					
					// 합치기                    
                   	var spotList_detail_2 = usetime + restdate + parking + expagerange + expguide;
					// 추가 정보 데이터 삽입
 					$('#spotList_detail_2').html(spotList_detail_2); 					
 					
                    
                    console.log(location.origin);     				
				             
						}
					
				},
				// 에러 발생시 실행되는 콜백 함수
				error : function(xtr, status, error) {
						alert(xtr + ":" + status + ":" + error);
						console.log("location.origin error >>> : " + location.origin); // url 값
				}
			});
			
		}			
		</script>
	</head>
	<body>
		<%@ include file="/main.jsp" %>
		<div class="main">
			<div class="contents">
				<div class="sub_header">
				<!-- 제목 -->
				</div>
				<div class="sub_content">
					<div class="detail_wrap">
						<!-- 정보란 -->
						<div class="detail_basic">
							<!-- 상위 정보란 -->
							<div class="photo">
							<!-- 이미지 -->
								<span id="img"><!-- 이미지 데이터 들어감 --></span>
							</div>
							<div class="txt-wrap">
								<!-- 상위 정보-1 -->
								<div class="title-top">
									<!-- 제목 -->
									<p id="title_name"><!-- 제목 데이터 --></p>
								</div>
								<div class="info">
									<!-- 정보-1 -->
									<ul id="spotList_detail_1">
										<!-- 데이터 들어갈 것임-1 (주소, 문의전화, 홈페이지) -->
									</ul>									
								</div>
							</div>
						</div>
						<div class="detail-intro">
						<!-- 상세 설명 -->
							<p class="overview" id="overview"><!-- 상세설명 데이터 --></p>
						</div>
						<article class="article additionalList"> <!-- article 독립적으로 사용 -->
							<div class="detail-moreinfo">
								<div class="left-content">
									<!-- 왼쪽 추가정보 -->
									<h5>"추가정보"</h5>
								</div>
								<div class="right-content">
									<div class="moreinfo-wrap">
										<!-- 오른쪽 추가 정보 -->
										<ul id="spotList_detail_2">
										<!-- 데이터 들어갈 것임-2 (이용시간, 휴무일, 주차시설 등) -->
										</ul>
									</div>
									<span class="explain"> 데이터 제공 : Tour API</span>
								</div>
							</div>
						</article>
						<article class="article">
							<!-- 지도 -->
							 <!-- <div id="map" style="width:100%;height:250px;"> </div>-->
							<!-- 이미지 지도를 표시할 div 입니다 -->
							<div id="staticMap" style="width:600px;height:350px;"></div> 
								
						</article>
						<article class="article">
							<!-- 댓글 -->
							
								
						</article>						
					</div>
				</div>
			</div>
		</div>
		
		<!-- kakao map javascript key: 8c7eef76db7690068e94ecb96c61ea6c -->
		<!-- &libraries=services -->
		<!-- <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8c7eef76db7690068e94ecb96c61ea6c&libraries=services" ></script>  -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c7eef76db7690068e94ecb96c61ea6c"></script>
		<script>
			function viewmap(lattitue, longtitue, title) {
				console.log("위도: " + lattitue + " / 경도: " + longtitue);
				
				
				// 이미지 지도에 표시할 마커입니다
				var marker = {
				    position: new kakao.maps.LatLng(lattitue, longtitue), 
				    text: title // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
				};

				var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
				    staticMapOption = { 
				        center: new kakao.maps.LatLng(lattitue, longtitue), // 이미지 지도의 중심좌표
				        level: 3, // 이미지 지도의 확대 레벨
				        marker: marker // 이미지 지도에 표시할 마커
				    };

				// 이미지 지도를 생성합니다
				var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);	
		}
		</script>		
	</body>
</html>

				