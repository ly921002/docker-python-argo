# 使用官方 Python 镜像
FROM python:3.12-alpine

WORKDIR /app

# 安装必要依赖
RUN apk add --no-cache bash curl unzip gcompat ca-certificates iproute2

# 复制 requirements.txt（如果有第三方库）或者直接用 pip 安装
COPY requirements.txt ./ 
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件
COPY main.py ./  # 你的 python 主文件
COPY public ./public

EXPOSE 3000/tcp

CMD ["python", "main.py"]
