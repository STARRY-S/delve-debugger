FROM registry.suse.com/suse/sle15:15.5

ARG GO_VERSION
ARG DLV_VERSION

ENV PATH $PATH:/usr/local/go/bin

RUN zypper --non-interactive install --no-recommends git sudo wget
RUN wget -O - https://storage.googleapis.com/golang/go1.16.4.linux-amd64.tar.gz | tar -xzf - -C /usr/local
RUN CGO_ENABLED=0 go install -ldflags '-extldflags -static' github.com/go-delve/delve/cmd/dlv@v${DLV_VERSION}
RUN mv /root/go/bin/dlv /usr/bin

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
