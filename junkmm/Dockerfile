# build Stage
FROM python:3.8-alpine as builder

WORKDIR /app

# Copy requirements, Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Application Code
COPY myapp/ .
RUN rm requirements.txt

# deploy Stage
FROM builder

WORKDIR /app

# Copy dependencies from build stage
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages

# Copy Application from build stage
COPY --from=builder /app/* .

CMD ["python", "app.py"]
