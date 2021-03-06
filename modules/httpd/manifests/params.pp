# Class: httpd::params
#
# This class manages Apache parameters
#
# Parameters:
# - The $user that Apache runs as
# - The $group that Apache runs as
# - The $apache_name is the name of the package and service on the relevant
#   distribution
# - The $php_package is the name of the package that provided PHP
# - The $ssl_package is the name of the Apache SSL package
# - The $apache_dev is the name of the Apache development libraries package
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class httpd::params {

  $auth          = false
  $group         = 'www-data'
  $options       = 'Indexes FollowSymLinks MultiViews'
  $priority      = '25'
  $redirect_ssl  = false
  $serveraliases = undef
  $servername    = undef
  $ssl           = true
  $template      = 'httpd/vhost-default.conf.erb'
  $user          = 'www-data'
  $vhost_name    = '*'

  case $::operatingsystem {
    'centos', 'redhat', 'fedora', 'scientific': {
      $apache_name = 'httpd'
      $php_package = 'php'
      $mod_python_package = 'mod_python'
      $mod_wsgi_package = 'mod_wsgi'
      $ssl_package = 'mod_ssl'
      $apache_dev  = 'httpd-devel'
      $vdir = '/etc/httpd/conf.d/'
    }
    'ubuntu', 'debian': {
      $apache_name = 'apache2'
      $php_package = 'libapache2-mod-php5'
      $mod_python_package = 'libapache2-mod-python'
      $mod_wsgi_package = 'libapache2-mod-wsgi'
      $ssl_package = 'apache-ssl'
      $apache_dev  = ['libaprutil1-dev', 'libapr1-dev', 'apache2-dev']
      $vdir = '/etc/apache2/sites-enabled/'
    }
    default: {
      $apache_name = 'apache2'
      $php_package = 'libapache2-mod-php5'
      $mod_python_package = 'libapache2-mod-python'
      $mod_wsgi_package = 'libapache2-mod-wsgi'
      $ssl_package = 'apache-ssl'
      $apache_dev  = 'apache-dev'
      $vdir = '/etc/apache2/sites-enabled/'
    }
  }
}
