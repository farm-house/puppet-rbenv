##
# Class: ruby::gems::bundler
#
# This module manages configuration of the Bundler gem. It's not meant to be
# used directly. Rather, it's invoked when bundler is installed normally with
# ruby::gem { "bundler:" }
#
# Sample Usage:
#   include ruby::gems::bundler
#
class ruby::gems::bundler {
  ruby::gem { 'bundler': }

  # copy the bundler env file
  file { '/etc/profile.d/bundler.sh':
    source => 'puppet:///modules/ruby/bundler.sh',
    owner  => 'root',
    group  => 'root',
  }
}
