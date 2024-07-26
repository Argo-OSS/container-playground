from flask import Flask

app = Flask(__name__)

@app.route('/api/v1/xcelxlorx')
def hello():
    return {"msg": "Hello, xcelxlorx"}

@app.route('/healthcheck')
def healthcheck():
   return {"status": "healthy"}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
