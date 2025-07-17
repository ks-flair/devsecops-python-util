FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "📦 Installing system packages..." \
 && apt-get update -qq \
 && apt-get install -qq -y --no-install-recommends \
      jq bash curl \
      unzip \
      zip \
      groff \
      less \
 > /dev/null \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "✅ Packages installed successfully."

RUN pip install --no-cache-dir --break-system-packages awscli virtualenv \
  && python -m pip install --upgrade pip \
  && python -c "print('Virtualenv is active!')"

# (Optional) Setup working directory
WORKDIR /app
COPY . /app

CMD ["python3"]
