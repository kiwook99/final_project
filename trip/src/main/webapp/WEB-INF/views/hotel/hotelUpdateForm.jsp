<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.log4j.LogManager"%>

<%@ page import="take.a.trip.hotel.vo.HotelVO" %> 
<%@ page import="java.util.List" %>  

<%@ page import="take.a.trip.hotel.util.CommonUtils" %>

<% request.setCharacterEncoding("UTF-8");%>	
<% 	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("hotelSelect 페이지");	
	
%>    
<%

	Object obj = request.getAttribute("updateList");

	List<HotelVO> list = (List<HotelVO>)obj;
	int nCnt = list.size();
	
	String hotelprice="";
	HotelVO hvo = null;
	
	if(nCnt==1){
	hvo = list.get(0);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Hotel Main</title>
    <!-- 기존 jQuery 제거 -->
    <!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
    <!-- 최신 버전의 jQuery 로딩 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.css">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zsrcsa9kp7&submodules=panorama"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- 슬라이드 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 스타일 -->
		<style type="text/css">
		
	* {
		margin: 0;		/* 여백 제거*/
		padding: 0;		/* 패딩 제거*/
	}


	.img {
		display: block;	/* 한 줄 모두 차지*/
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
	
	div {
	box-sizing: border-box;
	}

   
    .swiper-pagination {
     position: absolute;
     left: 50%;
     bottom: 20px;
     transform: translateX(-50%);
     z-index: 10;
     display: flex;
    }

	.swiper-pagination-bullet-active {
    background-color: #fff;
    }

	.swiper-container{
	height:700px;
	position: relative;	/* 요소 자기 자신을 기준으로 배치 */
	}

	.swiper-slide {
    align-items: center;
    justify-content: center;
	}

	.swiper-slide img {
	    width: 100%; /* width, height 부모 요소에 대해 이미지가 가득 차도록 함*/
		height: 100%; 
		object-fit: fill; /*  이미지가 자동으로 크기 조정되어 부모 요소에 가득 차도록 설정, 이미지는 종횡비를 유지하고 주어진 크기를 채움, 이미지가 맞게 잘림 */
		object-position: 50% 50%;	/* 이미지 중앙 정렬*/
	}
		 
	 .area {
	    background: rgba(0, 0, 0, 0.5);
	    border-radius: 20px;
	    color: #fff;
	    font-weight: 700;
	    top: 10px; /* 조절할 수 있는 값으로 변경 */
	    left: 10px; /* 조절할 수 있는 값으로 변경 */
	}
	
	.area::before {
	    content: '';
	    display: inline-block;
	    background: url('${pageContext.request.contextPath}/resources/images/지도.png') 0 0 / 100% 100% no-repeat;
	    width: 17px;
	    height: 20px;
	    margin-right: 3px;
        vertical-align: -1px;
	}
	 

	.area {
	   	font-size: 20px;
	    height: 26px;
	    line-height: 26px;
	    padding: 0 9px;
	    border-radius: 20px;
	    position: static;
	}
	
	.sub-title{
	font-size: 24px;
    padding: 24px 0;
    line-height: 1;
    color: #000;
    font-weight: 800;
    text-align: center;
	}
	
	.sub-header{
	border-bottom: 2px solid #000;
	padding: 10px 0 0;
    height: auto;
    margin-left: 100px;
    margin-right: 100px;
	}
	
	.next {
   	margin-left: 100px;
    margin-right: 100px;
    
	}
	
	.detail-basic{
	padding-bottom: 80px;
    display: flex;
    justify-content: space-between;
	}
	
	.slider {
	flex: 1; /* 나머지 공간을 모두 채우도록 설정 */
    max-width: 40%; /* 최대 너비 설정 */
	margin: 0px 100px;
	}
	
	.hotelUpdate {
		flex: 1; /* 나머지 공간을 모두 채우도록 설정 */
	    width: 55%; /* 혹은 다른 크기로 조절할 수 있습니다 */
	    margin-right:200px;
	}
		
	.detail {
    padding-top: 20px;

	}
	
	.swiper-button-prev,
	.swiper-button-next {
	    color: #000; /* 아이콘 색상 설정 */
	}
	
	.name {
	font-size:23px;
	}
	
	.info li {
	margin-left: 25px;
	margin-bottom:15px;
	font-weight: bold;
	}
	
	.container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      align-items: flex-start;
    }
	
	.txt{
	width: 15%;
	text-align-last: center;
	}
	
	.mapContainer {
      width: 30.3%; /* 지도 컨테이너의 최대 너비 설정 */
      margin-right: auto;
      height: 450px 
    }

    
	.coment{
	background-color:#f7f7f7;
	border-radius: 10px;
	padding: 20px;
    font-weight: bold;
    color:#444;
	}

	
	#mapContainer {
        display: flex;
        width: 100%;
        height: 600px;
        margin-bottom: 30px;
    	margin-top: 30px;
    }

    #map,
    #pano {
        flex: 1;
        height: 100%;
    }

	#map{
	margin-left:100px;
	}
	
	#pano{
	margin-right:100px;
	}
	
	.update{
	margin-top:30px;
	}
	</style>
		
	<script type="text/javascript">
	   $(document).ready(function(){
		      console.log("숙소 상세페이지 접속");

		   });
	   
	   $(document).on("click", "#hotelupdateBtn", function(){
           console.log("hotelupdateBtn 진입");
           alert("수정버튼");

           $('#hotelUpdate').attr({
        	   'action' : 'hotelUpdate?hotelnum=<%= hvo.getHotelnum() %>',
               'method' : 'POST',
               'enctype' : 'multipart/form-data' 
           }).submit(); 
       });
	   
	   function viewMap(name,mapx,mapy) {
			
	        var mapContainer = $('<div id="map"></div>');
	        var panoContainer = $('<div id="pano"></div>');
	        $('#mapContainer').empty().append(mapContainer).append(panoContainer);

	        var map = new naver.maps.Map(mapContainer[0], {
	            center: new naver.maps.LatLng(mapy, mapx),
	            zoom: 18
	        });

	        var marker = new naver.maps.Marker({
	            position: new naver.maps.LatLng(mapy, mapx),
	            map: map
	        });
	        
	        pano = new naver.maps.Panorama("pano", {
                position: new naver.maps.LatLng(mapy, mapx),
                pov: {
                    pan: -133,
                    tilt: 0,
                    fov: 100
                }
            });
	        
	        naver.maps.Event.addListener(pano, 'pano_changed', function () {
                var latlng = pano.getPosition();

                if (!latlng.equals(map.getCenter())) {
                    map.setCenter(latlng);
                }
            });
	        
	        var streetLayer = new naver.maps.StreetLayer();
            naver.maps.Event.once(map, 'init', function () {
                streetLayer.setMap(map);
            });

            var btn = $('#street');
            btn.on("click", function (e) {
                e.preventDefault();

                if (streetLayer.getMap()) {
                    streetLayer.setMap(null);
                } else {
                    streetLayer.setMap(map);
                }
            });
            
            naver.maps.Event.addListener(map, 'streetLayer_changed', function (streetLayer) {
                if (streetLayer) {
                    btn.addClass('control-on');
                } else {
                    btn.removeClass('control-on');
                }
            });
            
            naver.maps.Event.addListener(map, 'click', function (e) {
                if (streetLayer.getMap()) {
                    var latlng = e.coord;
                    pano.setPosition(latlng);
                }
            });
		   
	        var contentString = [
	            '<div class="iw_inner">',
	            '   <h3>' + name + '</h3>',
	            '   </p>',
	            '</div>'
	        ].join('');
		   
	        var infowindow = new naver.maps.InfoWindow({
	            content: contentString
	        });

	        naver.maps.Event.addListener(marker, "click", function(e) {
	            if (infowindow.getMap()) {
	                infowindow.close();
	            } else {
	                infowindow.open(map, marker);
	            }
	        });

	        infowindow.open(map, marker, pano);
	    }
	   
	  
</script>
</head>
<body>


<div class="sub-header">
			<h3 class="sub-title">숙박 수정  </h3>
				</div>
				<div class="hotelSelect">
					<div class="detail">
						<div class="detail-basic">
						<div class="slider">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<%
								        String[] imageUrls = hvo.getHotelimage().split(",");
								        for (String imageUrl : imageUrls) {
								    %>
										<div class="swiper-slide">
											 <img src="<%= imageUrl.trim() %>">
										</div>
									<%
										}
									%>
								</div>
								<div class="page_box">
									<div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide"></div>
									<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"></div>
								</div>
							</div>
						</div>	
						<form class="hotelUpdate" method="POST" action="hotelUpdate?hotelnum=<%= hvo.getHotelnum() %>">
							<div class="title">
								<span class="area">
									<%= hvo.getRegionid() %>
								</span><br><br>
								<span class="name">
									<h3><input type="text" class="hotelname" name="hotelname" id="hotelname" value="<%= hvo.getHotelname() %>" size="40"></h3>
								</span><br><hr>
								<span class="info"><br>
									<ul>
										<li> 주소	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="hoteladress" name="hoteladress" id="hoteladress" value="<%= hvo.getHoteladress() %>" size="40"> </li>
										<li> 번호	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="hoteltel" name="hoteltel" id="hoteltel" value="<%= hvo.getHoteltel().replace("<br>", "&nbsp;/&nbsp;") %>" size="40"></li>
										<li> 가격	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="hotelprice" name="hotelprice" id="hotelprice" value="<%= hvo.getHotelprice() %>" size="40"> </li>
										<li> 체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="hotelcheckin" name="hotelcheckin" id="hotelcheckin" value="<%= hvo.getHotelcheckin().replace("<br>", "&nbsp;/&nbsp;") %>" size="40"></li>
										<li> 체크아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="hotelcheckout" name="hotelcheckout" id="hotelcheckout" value="<%= hvo.getHotelcheckout().replace("<br>", "&nbsp;/&nbsp;") %>" size="40"></li>
									</ul>
								</span>
								</div><br>
								<div class="coment">
									<p class="overview">
										<textarea class="hotelcoment" name="hotelcoment" id="hotelcoment" style="width: 100%; height: 100px;" oninput="autoResize(this)"><%= hvo.getHotelcoment() %></textarea>
									</p>
								</div>
								<div class="update">
									<input type="submit" value="수정하기" id="hotelupdateBtn" class="hotelupdateBtn">
									<a href ="hotelSelect?hotelnum=<%= hvo.getHotelnum() %>"> <input type="button" value="돌아가기" > </a>
								</div>
							</form>
						</div>
						<hr class="next"><br>
						<div class="container">
						<div class="txt">
							<h2>지도</h2>
						</div>
						<div class="mapContainer" id="mapContainer">
								   
						</div>


					</div>
				</div>
			</div>
			
		 <script type="text/javascript">
			new Swiper('.swiper-container',{
				
				slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
				spaceBetween : 10, // 슬라이드간 간격
				slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
			
				// 그룹수가 맞지 않을 경우 빈칸으로 메우기
				// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
				loopFillGroupWithBlank : true,
			
				loop : true, // 무한 반복 여부
			
				pagination : { // 페이징
					el : '.swiper-pagination',
					clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
				},
				navigation : { // 네비게이션
					nextEl : '.swiper-button-next', // 다음 버튼 클래스명
					prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
				},
			});

		        viewMap('<%= hvo.getHotelname() %>', <%= hvo.getHotelmapx() %>, <%= hvo.getHotelmapy() %>);

		    function autoResize(textarea) {
		        textarea.style.height = 'auto'; // Reset the height to auto
		        textarea.style.height = (textarea.scrollHeight) + 'px'; // Set the height to the scrollHeight
		    }
		</script>
		
	</body>
</html>		
</body>
</html>