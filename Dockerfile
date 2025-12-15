FROM docker.n8n.io/n8nio/n8n:1.119.2

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

RUN apk add --no-cache \
    python3 \
    py3-pip

USER node
