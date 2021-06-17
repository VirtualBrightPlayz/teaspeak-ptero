# ----------------------------------
# Environment: ubuntu
# Minimum Panel Version: 0.7.X
# ----------------------------------
FROM    quay.io/parkervcp/pterodactyl-images:base_ubuntu

LABEL   author="Dex's Lab" maintainer="dex35803@gmail.com"

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt update -y \
        && apt upgrade -y \
        && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
        && dpkg -i packages-microsoft-prod.deb \
        && apt update -y \
        && apt install -y dotnet-sdk-5.0 aspnetcore-runtime-5.0 dotnet-sdk-2.1 dotnet-sdk-3.1 libgdiplus ffmpeg libleptonica-dev libtesseract-dev tesseract-ocr automake ca-certificates g++ git libtool libleptonica-dev make pkg-config python \
        && wget https://yt-dl.org/downloads/latest/youtube-dl /home/container/youtube-dl \
        && chmod a+x /home/container/youtube-dl


USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
