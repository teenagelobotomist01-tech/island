lock "~> 3.19.0"

set :application, "island"
set :repo_url, "git@github.com:teenagelobotomist01-tech/island.git"

set :deploy_to, "/var/www/island"
set :branch, "main"

set :linked_files, fetch(:linked_files, []).push(
  "config/master.key",
  "config/credentials/production.key"
)


set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system")

set :keep_releases, 5

