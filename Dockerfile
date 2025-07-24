FROM python:3.12-slim

RUN apt update -y && apt install -y awscli

WORKDIR /app

COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
