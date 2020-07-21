FROM alpine:latest

RUN apk add --no-cache curl python3 py-pip gettext bash openssl openssh
RUN pip install awscli
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN helm repo add pingidentity-pc https://patrickcping.github.io/ping-identity-helm-charts-repo
RUN helm repo update
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
