FROM python:3-slim-bookworm

RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 --gid 1000 -ms /bin/bash appuser

RUN pip3 install --no-cache-dir --upgrade pip

RUN apt-get update && apt-get install -y git
#    build-essential \
#    software-properties-common \

RUN rm -rf /var/lib/apt/lists/*

USER appuser
WORKDIR /home/appuser

EXPOSE 8501

CMD python -m streamlit hello