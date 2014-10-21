To run the server:

    docker run --privileged --name ovs larsks/ovs-server

To link a container to the OVS managed network namespace:

    docker run -it --privileged \
      --net=container:ovs \
      --volumes-from=ovs larsks/ovs-base bash

This will get you a shell prompt from which you can run OVS commands:

    bash-4.2# ovs-vsctl show
    f9aa247b-d8a8-43b3-a42e-3d1fc56b6fee
        ovs_version: "2.3.0"
    bash-4.2# ovs-vsctl add-br br-testing
    bash-4.2# ip link add north type veth peer name south
    bash-4.2# ovs-vsctl add-port br-testing north
    bash-4.2# ovs-vsctl show
    f9aa247b-d8a8-43b3-a42e-3d1fc56b6fee
        Bridge br-testing
            Port north
                Interface north
            Port br-testing
                Interface br-testing
                    type: internal
        ovs_version: "2.3.0"
    bash-4.2# ip addr
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
           valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: ovs-system: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default 
        link/ether 02:0a:6e:5f:e6:d7 brd ff:ff:ff:ff:ff:ff
    3: br-testing: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default 
        link/ether 2e:06:ed:5a:47:43 brd ff:ff:ff:ff:ff:ff
    4: south: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
        link/ether a6:e8:98:5b:ab:e9 brd ff:ff:ff:ff:ff:ff
    5: north: <BROADCAST,MULTICAST> mtu 1500 qdisc noop master ovs-system state DOWN group default qlen 1000
        link/ether 4e:37:28:9e:e2:8e brd ff:ff:ff:ff:ff:ff
    214: eth0: <BROADCAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
        link/ether 02:42:ac:11:00:14 brd ff:ff:ff:ff:ff:ff
        inet 172.17.0.20/16 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 fe80::42:acff:fe11:14/64 scope link 
           valid_lft forever preferred_lft forever

