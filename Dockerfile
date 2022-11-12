FROM alpine:3.16.2 as download

RUN wget https://image.easyeda.com/files/easyeda-linux-x64-6.5.22.zip
RUN unzip easyeda-linux-x64-6.5.22.zip

FROM debian:bullseye-20221024-slim

RUN apt-get update && apt-get install -y libcanberra-gtk3-module \
                                         libx11-xcb-dev \
                                         dconf-service \
                                         libglib2.0-0 \
                                         libgtk-3-0 \
                                         libasound2 \
                                         libxss1 \
                                         libnss3

COPY entrypoint.sh .

RUN mkdir -p /projects /run/dbus

COPY --from=download easyeda-linux-x64 easyeda-linux-x64

ENTRYPOINT [ "./entrypoint.sh" ]
