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
# None.
#
# === Authors
#
# Christoph Görn <goern@redhat.com>
#
# === Copyright
#
# Copyright 2015 Red Hat GmbH
#
class ose3idmclient(
  $ipa_domain = $ose3idmclient::params::ipa_domain,
  $ipa_server = $ose3idmclient::params::ipa_server
) inherit ose3idmclient::params {
  $ipa_realm = upcase($ipa_domain)

  notify {"DEBUG: IPA ${ipa_domain}/${ipa_realm} on server ${ipa_server}":}

  package { "ipa-client": ensure => 'present' }

  exec { "/usr/sbin/ipa-client-install  --server=${ipa_server} --domain=${ipa_domain} --nisdomain=${ipa_domain} --realm=${ipa_realm} --enable-dns-updates --mkhomedir -w secret --unattended":
    require => [ Package["ipa-client"] ],
    unless => "/usr/bin/grep 'ipa_domain = acme.example.com' /etc/sssd/sssd.conf"
  }
}
