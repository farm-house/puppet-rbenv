##
# Class: ruby::rbenv
#
# This class installs manages ruby versions with rbenv
#
# Sample Usage:
#   include rbenv
#
class ruby::rbenv {
  # clone the rbenv repo
  git::clone { '/usr/local/rbenv':
    source => 'git://github.com/sstephenson/rbenv.git',
    owner  => 'root',
  }

  # copy the rbenv env file
  file { '/etc/profile.d/rbenv.sh':
    source => 'puppet:///modules/ruby/rbenv.sh',
    owner  => 'root',
    group  => 'root',
  }

  # install ruby-build
  ruby::rbenv::plugin { 'ruby-build':
    source => 'git://github.com/sstephenson/ruby-build.git',
  }
}
