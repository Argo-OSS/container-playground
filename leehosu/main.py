from fastapi import FastAPI
from fastapi.responses import RedirectResponse

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "root endpoint!"}

@app.get("/api/v1/leehosu")
def root():
    return {"message": "Hello, Lake!"}

@app.get("/healthcheck")
def healthcheck():
    return {"status": "healthy"}
