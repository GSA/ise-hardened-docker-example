FROM nginx:1.18.0

LABEL name=gsa_nginx
LABEL version="1.0"

RUN echo "Updating and Patching" && \
apt-get update -yq && apt-get -yq upgrade

COPY scripts/ /gsa-fix/

RUN echo "Hardening" && \
  chmod +x /gsa-fix/* && \
  /gsa-fix/GSA_unwanted_packages.sh && \
  /gsa-fix/GSA_remove_extra_files.sh
