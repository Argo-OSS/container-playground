FROM python:3.12-slim

RUN pip3 install aiohttp

COPY . .

EXPOSE 8080

ENTRYPOINT [ "python3" ,  "server.py" ]