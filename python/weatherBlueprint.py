from flask import Flask
from flask_cors import CORS

from weatherAPI import app as weather_api


app = Flask(__name__)
app.debug = True
app.config['JSON_AS_ASCII'] = False

CORS(app)

app.register_blueprint(weather_api)


if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5001)