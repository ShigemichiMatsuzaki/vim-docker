FROM ubuntu:18.04

# Install "add-apt-repository"
RUN apt-get update && apt-get install -y software-properties-common && \
    apt-get clean && \
	  rm -rf /var/lib/apt/lists/*rm   
     
RUN add-apt-repository ppa:jonathonf/vim && \
    apt-get update && apt-get -y install git vim && \
    apt-get clean && \
	  rm -rf /var/lib/apt/lists/*rm   

COPY my_dotfiles /tmp/my_dotfiles

# Soft link to conf files
RUN ln -s /tmp/my_dotfiles/.vim /root/.vim
RUN ln -s /tmp/my_dotfiles/.vim/rc/.vimrc /root/.vimrc

ENV LANG "ja_JP.UTF-8"

WORKDIR /tmp
