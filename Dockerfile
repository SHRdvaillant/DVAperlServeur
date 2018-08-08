FROM perl:latest

LABEL MAINTAINER=dva

# Install Node etc...
RUN capnm IO::Socket::INET

# Copy source code to /DVAperlServeur in container
COPY . /DVAperlServeur

# Document the port the app listens on
EXPOSE 7777

# Run this command (starts the app) when the container starts
CMD cd /DVAperlServeur && perl ./serveur.pl
