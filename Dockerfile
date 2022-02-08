FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf update && microdnf install python3 tar gzip curl python3-requests-oauthlib python3-pip

# Install OC CLI
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz | tar zxvf - oc kubectl && \
    mv -f oc /usr/local/bin && \
    mv -f kubectl /usr/local/bin

# Install Helm
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/clients/helm/latest/helm-linux-amd64.tar.gz | tar -zxv && \
    mv helm /usr/local/bin/helm

RUN pip3 install --upgrade pip && pip3 install openshift kubernetes==17.17.0 PyYAML==5.4.1 passlib==1.7.4 ansible==4.2.0 ansible-core==2.11.2

ENTRYPOINT [“ansible-playbook”]
