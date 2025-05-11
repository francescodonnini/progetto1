FROM python:3.11-slim

WORKDIR /app

COPY server.py .
COPY IT_2021.csv .
COPY IT_2022.csv .
COPY IT_2023.csv .
COPY IT_2024.csv .
COPY SE_2021.csv .
COPY SE_2022.csv .
COPY SE_2023.csv .
COPY SE_2024.csv .

EXPOSE 8080

ENTRYPOINT ["python", "server.py"]