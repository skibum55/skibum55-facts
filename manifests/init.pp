# == Class: tiaa-facts
#
# Full description of class facts here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { facts:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class tiaa-facts {

# for debug output on the puppet client
notify { "DC is '${::dc}'": }
notify { "Location is '${::location}'": }
notify { "ENV is '${::env}'": }
notify { "IAM is: '${::IAM}'": }
notify { "Tier is '${::tier}'": }
notify { "App is '${::app}'": }
notify { "Site is '${::site}'": }
notify { "Hostname is '${::hostname}'": }
notify { "HARDWARE VENDOR is '${::uptime}'":}
notify { "Build is '${::BUILD}'":}
}
