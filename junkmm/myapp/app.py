from flask import Flask

app = Flask(__name__)

@app.route('/api/v1/junkmm', methods=['GET'])
def junkmm():
    return 'This is the response for /api/v1/junkmm!'

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    return 'OK'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
