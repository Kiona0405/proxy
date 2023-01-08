FROM python:3.7-buster

RUN pip install grpcio==1.47.0
RUN pip install grpcio-tools==1.47.0

WORKDIR /root
ADD helloworld helloworld
ADD protos protos

ENTRYPOINT ["python", "helloworld/greeter_server.py"]
