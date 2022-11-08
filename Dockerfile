FROM bookworm-20221024-slim

RUN wget https://image.easyeda.com/files/easyeda-linux-x64-6.5.22.zip
RUN unzip easyeda-linux-x64-6.5.22.zip

CMD ./easyeda-linux-x64-6.5.22/easyeda
