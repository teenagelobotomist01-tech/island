directory '/var/www/island/current'
rackup "/var/www/island/current/config.ru"
environment 'production'

pidfile "/var/www/island/shared/tmp/pids/puma.pid"
state_path "/var/www/island/shared/tmp/pids/puma.state"
stdout_redirect "/var/www/island/shared/log/puma.stdout.log", "/var/www/island/shared/log/puma.stderr.log", true

bind "unix:///var/www/island/shared/tmp/sockets/puma.sock"
workers 2
threads 1, 6
preload_app!

