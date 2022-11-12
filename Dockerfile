FROM node:18

USER node

# Setup SSH access
RUN mkdir ~/.ssh
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
COPY --chown=node id_ed25519 /home/node/.ssh/
RUN \
  eval "$(ssh-agent -s)" \
  ssh-add ~/.ssh/id_ed25519

# Clone the repo
RUN git clone git@github.com:ismailarilik/vue-contract.git /home/node/vue-contract
