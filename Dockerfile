# ----------  Dockerfile (place in repo root) ----------
# 1. Lightweight Python base image
FROM python:3.11-slim

# 2. Create working directory
WORKDIR /app

# 3. Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy application code and assets
COPY . .

# 5. Expose the port Streamlit will listen on
EXPOSE 8501

# 6. Environment tweak (optional but explicit)
ENV STREAMLIT_SERVER_PORT=8501 \
    STREAMLIT_SERVER_HEADLESS=true \
    STREAMLIT_SERVER_ADDRESS=0.0.0.0

# 7. Start the app
CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
# ------------------------------------------------------
