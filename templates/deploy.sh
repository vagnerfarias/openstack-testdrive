#!/bin/bash
openstack overcloud deploy --timeout 90  \
                           --templates \
                           --environment-directory /home/stack/templates/environments \
                            -e /usr/share/openstack-tripleo-heat-templates/environments/tls-endpoints-public-ip.yaml \
                           --ntp-server 2.fedora.pool.ntp.org 

