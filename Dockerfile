FROM n8nio/runners:1.121.0

USER root

# Add extra JS deps for JS Code node
RUN cd /opt/runners/task-runner-javascript && pnpm add moment uuid

# Add extra Python deps for Python Code node
RUN cd /opt/runners/task-runner-python && uv pip install numpy pandas

# Provide allowlist config
COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER runner
