FROM python:3.11-slim

# Cài công cụ cần thiết bao gồm Rust
RUN apt update && \
    apt install -y curl build-essential awscli && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    ln -s /root/.cargo/bin/cargo /usr/bin/cargo && \
    ln -s /root/.cargo/bin/rustc /usr/bin/rustc

# Thêm Rust vào PATH
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
