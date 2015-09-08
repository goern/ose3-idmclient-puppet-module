# == Class: ose3idmclient
#
# This class will join OpenShift Enterprise 3 hosts into IdM domain
#
# === Parameters
#
# None.
#
# === Variables
#
# None.
#
# === Examples
#
#  class { 'ose3idmclient':
#    servers => [ 'node-1.ose3.example.com', 'node-2.ose3.example.com' ],
#  }
#
# === Authors
#
# Christoph Görn <goern@redhat.com>
#
# === Copyright
#
# Copyright 2015 Red Hat GmbH
#
if versioncmp($::puppetversion,'3.6.1') >= 0 {
  Package {
    allow_virtual => true,
  }
}
class ose3idmclient {
  package { "ipa-client": ensure => 'present' }

  exec { "/usr/sbin/ipa-client-install  --server=acme-idm-srv-1.syseng.bos.redhat.com --domain=acme.example.com --nisdomain=acme.example.com --realm=ACME.EXAMPLE.COM --enable-dns-updates --mkhomedir -w secret --unattended":
    require => [
			Package["ipa-client"]
    ]
  }
}
