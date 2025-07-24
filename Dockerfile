FROM python:3.12-slim

# Cài các công cụ cần thiết để biên dịch thư viện Rust
RUN apt update -y && apt install -y \
    awscli \
    curl \
    build-essential \
    libssl-dev \
    pkg-config \
    git \
    gcc \
    cargo

WORKDIR /app

COPY . /app

# Cài các thư viện Python từ requirements.txt
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
