FROM python:3.10.17-alpine3.21 as builder
WORKDIR /app
COPY pyproject.toml ./
RUN pip install .[test]
COPY . .

FROM python:3.10.17-alpine3.21
WORKDIR /app
COPY --from=builder /app /app
RUN pip install --no-cache-dir .
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8016", "--reload"]
