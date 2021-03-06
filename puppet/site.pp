# install rvm using hiera.yaml settings
class { '::rvm': }

# install bundler gem
exec { 'bundler_install_gem':
    #user      => centos,
    path      => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin',
    cwd     => "/home/centos",
    command   => "gem install bundler",
    unless    => "gem list | grep bundler",
    logoutput => on_failure,
}

# install rake gem
exec { 'rake_install_gem':
    #user      => centos,
    path      => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin',
    cwd     => "/home/centos",
    command   => "gem install rake",
    unless    => "gem list | grep rake",
    logoutput => on_failure,
}

# install git package - used by vcsrepo
package { 'git':
    ensure => installed,
}

# install nodejs package used by rake
package { 'nodejs':
    ensure  => installed,
}

# clone the app code repository
vcsrepo { "/home/centos/webapp-demo":
    ensure   => latest,
    provider => git,
    require  => [ Package["git"] ],
    source   => "https://github.com/fellipecm/webapp-demo.git",
    revision => 'master',
}

# install deps start
package { 'sqlite-devel':
    ensure  => installed,
}

package { 'gcc':
    ensure  => installed,
}

package { 'zlib-devel':
    ensure  => installed,
}
# deps install end here

# bundle install
exec { "app-install":
    #user    => centos,
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin',
    cwd     => "/home/centos/webapp-demo",
    command => "bundle install",
    require  => [ Package["git"], Package["gcc"], Package["zlib-devel"] ],
    # TODO: unless
}

# execute rake db:migrate if needed
exec { "set-env":
    #user    => centos,
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin',
    cwd     => "/home/centos/webapp-demo",
    command => "bundle exec rake db:migrate RAILS_ENV=development",
    unless  => "bundle exec rake db:abort_if_pending_migrations",
    require => Exec["app-install"],
}

service { 'webapp':
  enable => true,
  ensure => 'running',
  require => Exec["set-env"],
}

# start the app in background mode
#exec { "start-env":
#    #user    => centos,
#    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin',
#    cwd     => "/home/centos/webapp-demo",
#    command => "/usr/bin/nohup bundle exec rails server -b 0.0.0.0 -p 3000 > webapp-demo.out 2>&1 &",
#    require => Exec["set-env"],
#    # TODO: unless
#}
