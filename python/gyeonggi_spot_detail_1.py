from flask import Flask, Blueprint, jsonify, redirect, render_template, request
from flask_cors import CORS
from urllib import request as req
from bs4 import BeautifulSoup
import requests

 

#app = Flask(__name__)
api_spot_detail_1  = Blueprint('api_spot_detail_1', __name__, url_prefix='/api_spot_detail_1')
            # 첫번째 인자 : url_for()에서 해당앱을 찾기 위한 키워드
            # 두번째 인자 : 정적파일과 템플릿 위치를 추적하기 위해
            # 세번째 인자 : 해당 앱의 공통 url


CORS(api_spot_detail_1)

# 인증키 : 8EkIWCf1E1Eb4unWFB0Ey%2BvRV60qhMsfqIfz35LIEP0Xo2y5%2F2rxq%2BJeSfUi%2BRg5Bo6i13gI5C3gMaBxomlBTg%3D%3D
# 한페이지 결과수(numOfRows) : 2000
# OS구분(MobileOS) : ETC -> IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)
# 어플명(MobileApp) : AppTest 
# 응답메세지 형식(_type) : xml -> REST방식의 URL호출 시 json값 추가(디폴트 응답메세지 형식은XML)
# 목록 구분(listYN) : Y (Y=목록, N=개수) 
# 정렬구분(arrange) : A (A=제목순, C=수정일순, D=생성일순) 대표이미지가반드시있는정렬(O=제목순, Q=수정일순, R=생성일순)
# 관광타입(contentTypeId) : 12 (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점)
# 지역코드(areaCode) : 31(경기도)
API_spot = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=8EkIWCf1E1Eb4unWFB0Ey%2BvRV60qhMsfqIfz35LIEP0Xo2y5%2F2rxq%2BJeSfUi%2BRg5Bo6i13gI5C3gMaBxomlBTg%3D%3D&numOfRows=2000&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=A&contentTypeId=12&areaCode=31"

# 데이터 가져오기
res = requests.get(API_spot)

 
#@app.route("/spot_detail_1/<contentid>", methods=['GET'])
#@api_spot_detail_1.route("/spot_detail_1/<contentid>", methods=['GET'])
@api_spot_detail_1.route("/spot_detail_1", methods=['GET'])
def spot_detail():
    # req로 contentId 찾아오기
    # contentId={contentId}로 값 안에 넣기
    # f-string 사용 : 문자열 입력시 특정 부분만 변경에 출력하고 싶을때 사용
    # 이클립스 에서  data: { contentid: contentid }로 데이터값 받아옴
    contentid  = request.args.get('contentid')

    # 받아온 contentid값을 경로에 넣어줌
    api_spot_detail_1 = f"https://apis.data.go.kr/B551011/KorService1/detailCommon1?serviceKey=8EkIWCf1E1Eb4unWFB0Ey%2BvRV60qhMsfqIfz35LIEP0Xo2y5%2F2rxq%2BJeSfUi%2BRg5Bo6i13gI5C3gMaBxomlBTg%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=xml&contentId={contentid}&contentTypeId=12&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=2000&pageNo=1"
    
    
    # api_spot_detail_1
    res_detail_1 = req.urlopen(api_spot_detail_1)
    soup_detail_1 = BeautifulSoup(res_detail_1, 'html.parser')

    # 여러개가 없으므로 select
    contentid = soup_detail_1.select('contentid')           # 해당 id값
    title_value = soup_detail_1.select('title')             # 제목(이름)
    homepage_value = soup_detail_1.select('homepage')       # 홈페이지
    addr1_value = soup_detail_1.select('addr1')             # 주소
    mapx_value = soup_detail_1.select('mapx')               # 경도
    mapy_value = soup_detail_1.select('mapy')               # 위도
    mlevel_value = soup_detail_1.select('mlevel')           # 확대
    overview_value = soup_detail_1.select('overview')       # 상세정보
    firstimage_value = soup_detail_1.select('firstimage')       # 상세정보
    

    # contentid길이(1)로 반복 .text
    item_list = []
    for i in range(len(contentid)):
        item_list.append({
            'title' : title_value[i].text,
            'homepage' : homepage_value[i].text,
            'addr1' : addr1_value[i].text,
            'mapx' : mapx_value[i].text,
            'mapy' : mapy_value[i].text,
            'mlevel' : mlevel_value[i].text,
            'overview' : overview_value[i].text,
            'firstimage' : firstimage_value[i].text,
            'contentid' : contentid[i].text

        })

        #print(item_list)
    return jsonify(item_list) # json 변환

''' 시도했던 구문
    detail_data_1 = {}
    items = soup_detail_1.find_all('item')
    
    if items:
        item = items[0] 
        detail_data_1['title'] = item.find('title').text
        detail_data_1['homepage'] = item.find('homepage').text
        detail_data_1['addr1'] = item.find('addr1').text
        detail_data_1['mapx'] = item.find('mapx').text
        detail_data_1['mapy'] = item.find('mapy').text
        detail_data_1['mlevel'] = item.find('mlevel').text
        detail_data_1['contentid'] = item.find('contentid').text
        detail_data_1['overview'] = item.find('overview').text
 
    
    print(detail_data_1)
    return jsonify(detail_data_1)
'''

            

#if __name__ == "__main__":
#    app.run(host='0.0.0.0', port=5001, debug=True)


