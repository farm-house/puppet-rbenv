##
# Definition: ruby::gem
#
# This module manages ruby gems
#
# Sample Usage:
#   ruby::gem { "passenger": }
#   ruby::gem { "passenger": ensure => "1.0.0" }
#
define ruby::gem(
  $ensure = latest,
) {
  include ruby

  $gem_home    = '/usr/local/rbenv/gems'
  $version_arg = $ensure ? { latest => '', default => "-v ${ensure}" }

  exec { "ruby::gem::install ${ensure} ${title}":
    environment => "GEM_HOME=${gem_home}",
    command     => "gem install ${title} ${version_arg} --no-ri --no-rdoc",
    creates     => "${gem_home}/gems/${title}-${ensure}",
    require     => Ruby::Install['default'],
  }

  if $title == 'bundler' {
    include ruby::gems::bundler
  }
}
