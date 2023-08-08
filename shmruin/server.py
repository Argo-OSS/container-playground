from flask import Flask, render_template, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/v1/shmruin', methods=['GET'])
def simpleApi():
    return "This is the /api/v1/shmruin endpoint"

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    return jsonify(status="ok")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)