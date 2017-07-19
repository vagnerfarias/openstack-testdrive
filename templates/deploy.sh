#!/bin/bash
openstack overcloud deploy --timeout 90  \
                           --templates \
                           --environment-directory /home/stack/templates/environments \
                           --ntp-server 2.fedora.pool.ntp.org 

