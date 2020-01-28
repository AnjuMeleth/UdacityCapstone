FROM ubuntu:18.04
RUN apt-get update && apt-get install -y --no-install-recommends python==2.7 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install flask==1.1.1

COPY app.py /opt/app.py

# hadolint ignore=DL3025
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0

