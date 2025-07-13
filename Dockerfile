# Pythonの軽量イメージを使用
FROM python:3.11-slim

# 作業ディレクトリ作成
WORKDIR /app

# 依存関係ファイルがある前提で requirements.txt を置く
COPY requirements.txt .

# 依存パッケージのインストール
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーション全体をコピー
COPY . .

# FastAPI を起動（main.py の app オブジェクトを指定）
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]