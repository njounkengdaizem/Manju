from flask import Flask, jsonify, request, json
from manjuBackend import Manju

app = Flask(__name__)

manju = Manju()

@app.route('/getRequest', methods=['GET'])
def get_request():
    response = {"response": ["Temporary. Not being used."]}
    return jsonify(response)

@app.route('/postRequest', methods=['POST'])
def post_request():
    request_data = request.get_json()
    if not request_data:
        return "No data received", 400 # Return an error response
    result = manju.executioner(request_data[0])
    return jsonify({"response": result})

if __name__ == '__main__':
    app.run(port=5500, debug=True)
