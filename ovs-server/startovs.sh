#!/bin/sh

/usr/share/openvswitch/scripts/ovs-ctl start \
          --system-id=random $OVS_OPTIONS


exec /pause.py

