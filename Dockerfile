
FROM ubuntu:latest

LABEL maintainer="valoyan2@gmail.com"

RUN apt-get update && apt-get upgrade -y

ENV DEBIAN_FRONTEND=noninteractive

ENV LIBGL_ALWAYS_INDIRECT=1

ENV QT_QPA_PLATFORM=xcb

RUN apt install -y python3-pip

RUN python3 -m pip install -U pip

RUN apt install -y git

RUN apt install -y xcb

RUN apt install -y python3-pyqt5

RUN apt-get install ffmpeg libsm6 libxext6  -y

RUN python3 -m pip install git+https://github.com/cms-l1-globaltrigger/tm-editor.git@0.13.0

