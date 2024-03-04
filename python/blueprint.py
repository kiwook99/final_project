# -*- encoding: utf-8 -*-
from flask import Flask
from flask_cors import CORS


from gyeonggi_spot import app as api_spot
from gyeonggi_spot_detail_1 import api_spot_detail_1 as api_spot_detail_1
from gyeonggi_spot_detail_2 import api_spot_detail_2 as api_spot_detail_2
from weatherAPI import app as weather_api


app = Flask(__name__)
app.debug = True
app.config['JSON_AS_ASCII'] = False

CORS(app)

"""
CORS : Cross Origin Resources Sharing
---------------------------------------------
자바스크립트(같은 도메인에서만 사용가능)를 사용한 api 등의 
리소스 호출시 동일 출처(같은 호스트네임)가 아니더라도 정상적으로 사용 

자바스크립트 : 동일출처정책(Same-Origin Policy) 외부서버에서 온 요청을 차단
"""

app.register_blueprint(api_spot)
app.register_blueprint(api_spot_detail_1)
app.register_blueprint(api_spot_detail_2)
app.register_blueprint(weather_api)

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5001)