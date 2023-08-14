FROM python:3.8-alpine

WORKDIR /app

# Copy requirements, Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Application Code
COPY myapp/ .

CMD ["python", "app.py"]
