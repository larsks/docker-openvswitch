FROM larsks/ovs-base
MAINTAINER Lars Kellogg-Stedman <lars@oddbit.com>

VOLUME /var/run/openvswitch/
VOLUME /var/log/openvswitch/

ADD startovs.sh /startovs.sh
ADD pause.py /pause.py
CMD ["/startovs.sh"]

