from flask import Flask

app = Flask(__name__)

@app.route('/api/v1/SeoJimin1234')
def my_github_account():
    return {"message": "This is SeoJimin1234"}

@app.route('/healthcheck')
def health_check():
    return {"status": "Jimin is very healthy"}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)