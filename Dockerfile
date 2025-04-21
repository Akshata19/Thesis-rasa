# syntax=docker/dockerfile:1
FROM python:3.10-slim

# 1) Install OS‑level deps if you need them:
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
  && rm -rf /var/lib/apt/lists/*

# 2) Create app directory
WORKDIR /app

# 3) Copy & install Python deps
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 4) Copy code
COPY . .

# 5) Expose the port (Railway will still use $PORT)
EXPOSE 5005

# 6) Tell Docker how to start Rasa
#    Using the exec‑form CMD ensures that the process is PID 1
CMD ["bash","-lc","rasa run --enable-api --cors \"*\" --host 0.0.0.0 --port $PORT"]
