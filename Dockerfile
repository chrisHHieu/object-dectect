FROM python:3.12-slim

# Cài các dependency hệ thống + rust
RUN apt update -y && \
    apt install -y awscli curl build-essential && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    export PATH="$HOME/.cargo/bin:$PATH"

# Thêm Rust vào PATH (cho cả RUN bên dưới)
ENV PATH="/root/.cargo/bin:$PATH"

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
