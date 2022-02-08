FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf update && microdnf install python3 curl python3-requests-oauthlib

# Install OC CLI
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz | tar zxvf - oc kubectl
RUN mv -f oc /usr/local/bin
RUN mv -f kubectl /usr/local/bin

# Install Helm
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/clients/helm/latest/helm-l                                   inux-amd64.tar.gz | tar zxvf - helm-linux-amd64
RUN mv helm-linux-amd64 /usr/local/bin/helm


CMD sleep 1000
