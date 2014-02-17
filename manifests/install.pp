##
# Define: ruby::install
#
# This definition mangages ruby installation with rbenv
#
define ruby::install() {
  include ruby::rbenv

  if $title == 'default' {
    $version = '1.9.3-p327'
  } else {
    $version = $title
  }

  exec { "ruby::install ${version}":
    command     => "rbenv install ${version}",
    environment => 'RBENV_ROOT=/usr/local/rbenv',
    creates     => "/usr/local/rbenv/versions/${version}",
    timeout     => 0,
    require     => Ruby::Rbenv::Plugin['ruby-build'],
  }

  if $title == 'default' {
    exec { "ruby::install set default: ${version}":
      command     => "rbenv global ${version}",
      environment => 'RBENV_ROOT=/usr/local/rbenv',
      require     => Exec["ruby::install ${version}"],
    }
  }
}
