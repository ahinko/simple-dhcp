FROM alpine:3.16.0

RUN apk add --update --no-progress --no-cache dhcp vim

RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

EXPOSE 67/udp 67/tcp

VOLUME ["/etc/dhcp"]

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]
