FROM postgres:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /venv

ENV PATH="/venv/bin:$PATH"
RUN pip install --no-cache-dir \
    dbt-postgres \
    sqlfluff \
    sqlfluff-templater-dbt

COPY init/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

