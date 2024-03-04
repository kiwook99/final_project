from flask import Blueprint, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from bs4 import BeautifulSoup
from urllib import request as req
from flask_cors import CORS


 

#app = Flask(__name__)
app = Blueprint('api_spot', __name__, url_prefix='/api_spot')
            # 첫번째 인자 : url_for()에서 해당앱을 찾기 위한 키워드
            # 두번째 인자 : 정적파일과 템플릿 위치를 추적하기 위해
            # 세번째 인자 : 해당 앱의 공통 url


CORS(app)




# 한 페이지당 아이템 개수
ITEMS_PER_PAGE = 16


@app.route("/spot", methods=['GET'])
def spot():
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
    res = req.urlopen(API_spot)

    # 데이터 파싱
    soup = BeautifulSoup(res, 'html.parser')

    # 현재 페이지 번호 가져오기
    page = int(request.args.get('page', 1))

    spot_list = []
    # 모든 <item> 태그에 대해 반복
    for items in soup.find_all('item'):
        # 각각의 <item> 태그에 대한 데이터 추출
        item_data = {}
        for items_child in items.children:
            # 값이 있을시 각태그 .text 부여
            if items_child.name is not None:
                item_data[items_child.name] = items_child.text

        # 'firstimage' 태그에 값이 있어야만 추가            
        if 'firstimage' in item_data and item_data['firstimage']:
            spot_list.append(item_data)


          

    # 페이지에 따른 데이터 슬라이싱
    start_idx = (page - 1) * ITEMS_PER_PAGE
    end_idx = start_idx + ITEMS_PER_PAGE
    page_data = spot_list[start_idx:end_idx]


    print(page_data)

    # JSON 형태로 데이터 반환    
    return jsonify(page_data)
#    return jsonify(spot_list)



#if __name__ == "__main__":
#    app.run(host='0.0.0.0', port=5001, debug=True)


