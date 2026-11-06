# Entorno de practicas de Git - 1o DAW
FROM debian:stable-slim

# Herramientas: git y nano (bash ya viene incluido)
RUN apt-get update \
 && apt-get install -y --no-install-recommends git nano less ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Configuracion de Git para todos los alumnos
RUN git config --system init.defaultBranch main \
 && git config --system core.editor nano

# Todo el trabajo (repositorios y configuracion) vive en /practica
ENV HOME=/practica
ENV LANG=C.UTF-8
WORKDIR /practica

# Prompt y alias sencillos para la terminal
RUN echo 'PS1="\w \$ "' > /etc/practica.bashrc \
 && echo "alias ls='ls --color=auto'" >> /etc/practica.bashrc \
 && echo "alias ll='ls -la --color=auto'" >> /etc/practica.bashrc \
 && echo "echo 'Entorno de Git listo'" >> /etc/practica.bashrc

CMD ["bash", "--rcfile", "/etc/practica.bashrc"]