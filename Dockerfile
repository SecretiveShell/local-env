FROM archlinux:latest

# update the system to use the latest pkgs
RUN pacman -Sy --noconfirm \
    && pacman -S archlinux-keyring --noconfirm \
    && pacman -Syu --noconfirm

# install apps
RUN pacman -S --noconfirm \
    sudo \
    git \
    neovim \
    zsh \
    github-cli \
    docker \
    
    nvidia \
    nvidia-container-toolkit
    

# set user as my local user
RUN groupadd sudo
RUN useradd -m -G sudo -G docker TerminalMan
USER TerminalMan

# setup github
RUN git config --global user.name TerminalMan \
  && git config --global user.email "84923604+SecretiveShell@users.noreply.github.com" \
  && git config --global core.editor nvim

# install powerlevel10k
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
