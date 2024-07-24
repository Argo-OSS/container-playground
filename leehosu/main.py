from fastapi import FastAPI
from fastapi.responses import RedirectResponse

app = FastAPI()

@app.get("/")
def read_root():
    return RedirectResponse(url="/api/v1/leehosu")

@app.get("/api/v1/leehosu")
def root():
    return {"message": "Hello, Lake!"}

@app.get("/healthcheck")
def healthcheck():
    return {"status": "healthy"}
