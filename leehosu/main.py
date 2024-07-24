from fastapi import FastAPI

app = FastAPI()

@app.get("/api/v1/leehosu")
def root():
    return {"message": "Hello, Lake!"}

@app.get("/healthcheck")
def healthcheck():
    return {"status": "healthy"}
