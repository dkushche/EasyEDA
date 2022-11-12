FROM alpine:3.16.2 as download

RUN wget https://image.easyeda.com/files/easyeda-linux-x64-6.5.22.zip
RUN unzip easyeda-linux-x64-6.5.22.zip

FROM debian:bullseye-20221024-slim

RUN apt-get update && apt-get install -y libx11-xcb-dev \
                                         libglib2.0-0 \
                                         libgtk-3-0 \
                                         libasound2 \
                                         libxss1 \
                                         libnss3

RUN mkdir /projects

COPY --from=download easyeda-linux-x64 easyeda-linux-x64

CMD ./easyeda-linux-x64/easyeda
