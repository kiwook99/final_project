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
		
			.list_content ul {
				display: flex; 		/* flex : 수평으로 나열*/
				flex-wrap: wrap;	/* 화면 크기에 따라 자동 줄바꿈 */
			}
			
			ul, li {
				list-style: none;	/* 목록 스타일 제거*/
			}
			
			* {
				margin: 0;		/* 여백 제거*/
				padding: 0;		/* 패딩 제거*/
			}


			.img {
				display: block;	/* 한 줄 모두 차지*/
			}
			
			.list_content ul li .img {	/* 이미지 감싸는 요소 (span)*/
			    height: 250px;
			    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
			}		
			
			.list_content ul li .img img{
    			border-radius: 10px;	/* 외곽선 둥글게*/
			}	
						
			.list_content ul li {	/* 관광지 목록의 각 항목*/
			    width: 380px;
			    margin: 0 20px 40px 0;
			    position: relative;	/* 요소 자기 자신을 기준으로 배치 */
			}
			
			
			a:link, a:visited, a:focus, a:active {
			    text-decoration: none;
			}	/* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */
			
							
			
			.img img {
				width: 100%; /* width, height 부모 요소에 대해 이미지가 가득 차도록 함*/
				height: 100%; 
				object-fit: cover; /*  이미지가 자동으로 크기 조정되어 부모 요소에 가득 차도록 설정, 이미지는 종횡비를 유지하고 주어진 크기를 채움, 이미지가 맞게 잘림 */
				object-position: 50% 50%;	/* 이미지 중앙 정렬*/
			}
			
			img {
			    border: 0 none;	/* 외곽선 제거, 두께 0, 유형 없음*/
			}			
		

			body {
			    font-size: 17px;
			}	
		</style>
		
		
		<!-- 자바 스크립트 & 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript">
		
		// 현재 페이지 선언
		var currentPage = 1;
		
		// gyeonggi_spot.py
		function spot() {
			console.log("spot 함수 진입 >>> : ");
			
			// ajax 시작
			$.ajax({
				type: 'GET', <!-- GET / POST -->
				url: "http://127.0.0.1:5001/api_spot/spot", // url : flask, blueprint 참고, flask api 엔드 포인트
				data: {page : currentPage}, // 페이징을 위한 값
				dataType: 'JSON', // 데이터 타입
				success : function(spot_list) { // 성공할 시 실행되는 콜백 함수
					console.log("ajax 진입 >>> : ");
					
					console.log("spot_list >>> : " + spot_list); // flask로 받아온 데이터 값
					
					var spotList = $('#spotList'); // ul태그의 id
					
		            // 반복문: spot_list의 각 요소에 대해 작업
					// $.each() 메서드의 첫번째 매겨변수로 위에서 선언한 객체를 전달
				    // 객체를 전달받으면 index는 객체의 key(property)를 가리키고(반복문의 횟수)
				    // item은 키의 값을 가져옴(해당 태그안의 값, item태그 안에 값(태그))					
					$.each(spot_list, function(index, item) {
						
						if(item.firstimage.length > 0) { // 이미지 값이 존재하는 경우, 없으면 안보여 줄것임
					    var itemHtml = '<li>' +
									   '<a href="spot_detail" class="item">' +
									   '<span class="img">' + '<img src="' + item.firstimage + '" alt="' + item.title + '">' + 
									   '</span>' +
									   '<div class="spot_name" onclick="location.href=spot_detail">' + 
									   '<strong>' + item.title + '</strong>' +
									   '</div>' + 
									   '</a>' +
									   '</li>';
						}									   
									   
						spotList.append(itemHtml); // ul 태그안에 값을 추가
						
						console.log("location.origin >>> : " + location.origin); // url 값

					});
					
					// 페이지 버튼 추가
					addPageButtons();
				},
				// 에러 발생시 실행되는 콜백 함수
				error : function(xtr, status, error) {
						alert(xtr + ":" + status + ":" + error);
						console.log("location.origin error >>> : " + location.origin); // url 값
				}
			});
			
		}		
				// 페이지 변경 함수
				function changePage(direction) { // direction : 매개변수, 현재 페이지 조절하는 역할(changePage(값=direction))
					
					currentPage += direction; // 페이지 1씩 증가
					
					if (currentPage < 1) { // 현재페이지가 1미만이면 1로 선언
						currentPage = 1
					} // false일때
					$('#spotList').empty(); // ul태그 안에있는 자식요소 itemHtml를 모두 제거 새로운 페이지를 위해 이전 목록 비우는 역할
					console.log("currentPage >>> : " + currentPage);
					
					// spot() 함수 다시 실행
					spot();
				}
				
				// 페이지 버튼 함수
				function addPageButtons() {
					$('#buttonContainer').find('.pageButton').remove(); // pageButton 클래스를 찾아 제거
					$('#buttonContainer').prepend('<button class="pageButton" type="button" onclick="changePage(-1)"> 이전 페이지 </button>'); // 페이지 1씩 줄어듬
					$('#buttonContainer').append('<button class="pageButton" type="button" onclick="changePage(1)"> 다음 페이지 </button>'); // 페이지 1씩 늘어남
				}
				
				// 맨 처음 화면 시작할때 작동
				$(document).ready(function() {
					console.log("jQuery 진입 >>> : ");
					spot(); // spot() 함수 실행
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
					<div class="sub_search">
						<!-- 조건 검색 -->
					</div>
					<div class="sub_list">
						<div class="list_head">
							<!-- 페이지 수 -->
						</div>
						<div class="list_content">
							<!-- 관광지 -->
							<ul id="spotList">
								<!-- 데이터 들어갈 것임 -->
							</ul>
							<div id="buttonContainer"></div>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>