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
		
		
		// gyeonggi_spot.py
		function spot_detail(contentid) {
			console.log("spot 함수 진입 >>> : ");
			 
			// ajax 시작
			$.ajax({ 
				type: 'GET', 
				url: "http://127.0.0.1:5001/api_spot_detail_1/spot_detail_1", // url : flask, blueprint 참고, flask api 엔드 포인트
		        data: { contentid: contentid }, // contentid 전달
				dataType: 'JSON', // 데이터 타입
				success : function(item_list) { // 성공할 시 실행되는 콜백 함수
					console.log("ajax 진입 >>> : ");


					for(var i = 0; i < item_list.length; i++){
						// 제목
						var title = item_list[i].title;
						console.log("title >>> : " + title);						
						// 홈페이지 
						var homepage = item_list[i].homepage;
						console.log("homepage >>> : " + homepage);
						// 주소
						var addr1 = item_list[i].addr1;
						console.log("addr1 >>> : " + addr1);
						// x좌표
						var mapx = item_list[i].mapx;
						console.log("mapx >>> : " + mapx);
						// y좌표
						var mapy = item_list[i].mapy;
						console.log("mapy >>> : " + mapy);
						// 지도 level
						var mlevel = item_list[i].mlevel;
						console.log("mlevel >>> : " + mlevel);
						// 상세설명
						var overview = item_list[i].overview;
						console.log("overview >>> : " + overview);
						
                    var title_name = '<h4>' + title + '</h4>';
                    $('#title_name').html(title_name);
                  
                    
                    
                    // https://www.ggtour.or.kr/travel-info/tourism-info/a23c797c-a37c-4b82-80e9-e219470cbd40
                    // 주소, 홈페이지, 문의전화, 상세정보, 추가정보, 지도 등 구현할것
                    
                    
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
				
				// 맨 처음 화면 시작할때 작동
				$(document).ready(function() {
					console.log("jQuery 진입 >>> : ");
					
					// 현재 URL에서 contentid 추출
				    var contentid = window.location.href.split('/').pop();
					
					spot_detail(contentid); // spot() 함수 실행
				});
		</script>
	</head>
	<body>
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
							<p class="overview"><!-- 상세설명 데이터 --></p>
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
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

				