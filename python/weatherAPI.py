from bs4 import BeautifulSoup
from urllib import request as req
from flask import Flask, jsonify,Blueprint
from flask_cors import CORS

app = Flask(__name__)
app.debug = True
app.config['JSON_AS_ASCII'] = False

CORS(app)

API="https://www.weather.go.kr/w/rss/dfs/hr1-forecast.do?zone=1111061500"
res = req.urlopen(API)

soup = BeautifulSoup(res, 'xml')

hour = soup.select('body data:first-child>hour')
temp = soup.select('body data:first-child>temp')
wfKor = soup.select('body data:first-child>wfKor')
pop = soup.select('body data:first-child>pop')

for i in range(len(hour)):

    hour = hour[i].text
    temp = temp[i].text
    wfKor = wfKor[i].text
    pop = pop[i].text

    if(wfKor == "맑음"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB01.png";
    elif(wfKor == "구름 많음"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB03.png";
    elif(wfKor == "흐림"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB04.png";
    elif(wfKor == "비"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB08.png";
    elif(wfKor == "비/눈"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB13.png";
    elif(wfKor == "눈"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB11.png";
    elif(wfKor == "소나기"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB07.png";
    elif(wfKor == "빗방울"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB20.png";
    elif(wfKor == "빗방울/눈날림"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB22.png";
    elif(wfKor == "눈날림"):
        icon = "https://www.weather.go.kr/home/images/icon/NW/NB21.png";


app = Blueprint('weather_api', __name__, url_prefix='/weather_api')

@app.route('/weather', methods=['GET'])
def weather():
    return jsonify([hour,temp,wfKor,pop,icon])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)