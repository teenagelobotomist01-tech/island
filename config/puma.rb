# config/puma.rb

rails_env = ENV.fetch("RAILS_ENV", "development")
environment rails_env
puts ">>> Puma booting in ENV: #{rails_env}"

if rails_env == "development"
  directory "#{Dir.pwd}"
  port ENV.fetch("PORT", 3000)
  pidfile "tmp/pids/puma.pid"
  state_path "tmp/pids/puma.state"
  stdout_redirect "log/puma.stdout.log", "log/puma.stderr.log", true
else
  app_dir = "/var/www/island"
  shared_dir = "#{app_dir}/shared"
  current_dir = "#{app_dir}/current"

  rackup "#{current_dir}/config.ru"
  pidfile "#{shared_dir}/tmp/pids/puma.pid"
  state_path "#{shared_dir}/tmp/pids/puma.state"
  stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
  bind "unix://#{shared_dir}/tmp/sockets/puma.sock"
end

workers 2
threads 1, 6
preload_app!

