from flask import Flask, request, jsonify
from flask_cors import CORS
import requests
import base64
from io import BytesIO
from PIL import Image
from dotenv import load_dotenv
import os

load_dotenv()

api_key = os.getenv('API_KEY')

app = Flask(__name__)
CORS(app)

@app.route('/scan', methods=['POST'])
def clarifai_proxy():
    data = request.get_json()
    image_base64 = data.get('image_base64')
    
    if not image_base64:
        return jsonify({'error': 'No image provided'}), 400

    try:
        image_data = base64.b64decode(image_base64)
        image = Image.open(BytesIO(image_data))

        url = 'https://api.clarifai.com/v2/models/general-image-recognition/outputs'
        headers = {
            'Authorization': f'Key {api_key}',  
            'Content-Type': 'application/json',
        }

        json_data = {
            "inputs": [
                {
                    "data": {
                        "image": {
                            "base64": image_base64
                        }
                    }
                }
            ]
        }

        response = requests.post(url, json=json_data, headers=headers)

        if response.status_code == 200:
            result = response.json()
            material = result['outputs'][0]['data']['concepts'][0]['name']
            return jsonify({'material': material}), 200
        else:
            return jsonify({'error': 'Clarifai API request failed'}), 500

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
