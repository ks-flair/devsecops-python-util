FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "📦 Installing system packages..." \
 && apt-get update -qq \
 && apt-get install -qq -y --no-install-recommends \
      bash \
      curl \
      unzip \
      jq \
      groff \
      less \
 > /dev/null \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && echo "✅ Packages installed successfully."

# (Optional) Setup working directory
WORKDIR /app
COPY . /app

CMD ["python3"]

