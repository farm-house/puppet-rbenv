##
# Definition: ruby::rbenv::plugin
#
# This definition manages rbenv plugin installation
#
define ruby::rbenv::plugin(
  $source,
  $plugin_name = $name,
) {
  # create the "plugins" dir
  file { 'ruby::rbenv::plugins':
    ensure  => directory,
    path    => '/usr/local/rbenv/plugins',
    require => Git::Clone['/usr/local/rbenv'],
  }

  # install the plugin
  git::clone { "/usr/local/rbenv/plugins/${plugin_name}":
    source  => $source,
    owner   => 'root',
    require => File['ruby::rbenv::plugins'],
  }
}
