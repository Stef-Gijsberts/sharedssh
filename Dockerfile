FROM ubuntu:20.04

ARG TZ=Europe/Amsterdam
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y openssh-server sudo neovim python3 clang clangd gcc git tmux curl wget build-essential emacs python3-pip

RUN pip3 install -U setuptools && pip3 install -U pycodestyle pyls-mypy 'python-language-server[all]' && pip3 install -U msgpack pynvim

RUN useradd -m -s /bin/bash -g root -G sudo -u 1000 user
RUN echo 'user:hackme' | chpasswd

RUN su - user -c 'mkdir -p /home/user/.config/nvim/'
COPY ./tmux.conf /home/user/.tmux.conf
COPY ./init.vim /home/user/.config/nvim/init.vim

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

