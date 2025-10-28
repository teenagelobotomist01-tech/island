# config/puma.rb

environment ENV.fetch("RAILS_ENV") { "development" }

if ENV["RAILS_ENV"] == "development"
  directory "#{Dir.pwd}"
  port ENV.fetch("PORT") { 3000 }
  pidfile "tmp/pids/puma.pid"
  state_path "tmp/pids/puma.state"
  stdout_redirect "log/puma.stdout.log", "log/puma.stderr.log", true
else
  rackup "/var/www/island/current/config.ru"
  pidfile "/var/www/island/shared/tmp/pids/puma.pid"
  state_path "/var/www/island/shared/tmp/pids/puma.state"
  stdout_redirect "/var/www/island/shared/log/puma.stdout.log", "/var/www/island/shared/log/puma.stderr.log", true
  bind "unix:///var/www/island/shared/tmp/sockets/puma.sock"
end

workers 2
threads 1, 6
preload_app!

