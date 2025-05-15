FROM python:3.11-slim

WORKDIR /app

COPY server.py .
COPY data/ .

EXPOSE 8080

ENTRYPOINT ["python", "server.py"]