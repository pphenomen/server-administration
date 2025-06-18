FROM python:3.10-alpine

RUN apk update && apk upgrade

WORKDIR /app
COPY . .

RUN pip install .
RUN pip install pytest>=6.2.5 pytest-asyncio==0.25.3 httpx==0.28.1

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8016"]