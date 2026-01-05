FROM docker.n8n.io/n8nio/n8n:latest

USER root

RUN npm install -g \
    axios \
    lodash \
    dayjs \
    papaparse \
    cheerio \
    pdf-lib \
    qrcode \
    crypto-js \
    form-data \
    he \
    node-fetch@2

RUN echo "try { if (!global.fetch) global.fetch = require('node-fetch'); } catch(e) {}" \
    >> /usr/local/lib/node_modules/n8n/config/custom.js || true


RUN apt-get update && \
    apt-get install -y \
      python3 \
      python3-pip \
      python3-venv \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER node


