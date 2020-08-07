FROM archlinux:latest
# idk

# Install required packages
RUN pacman -Syu --noconfirm && \
  pacman -S --noconfirm which expect openvpn dialog python-pip python-setuptools git dante && \
  pip install protonvpn-cli

COPY ./vpn-setup.exp ./config.sh /tmp/

# protonvpn-cli needs access to width
ENV COLUMNS 80

RUN source /tmp/config.sh && \
  expect /tmp/vpn-setup.exp && \
  rm /tmp/vpn-setup.exp /tmp/config.sh

COPY ./sockd.conf /etc/
