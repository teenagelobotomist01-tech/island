lock "~> 3.19.0"

set :application, "island"
set :repo_url, "git@github.com:tuusuario/island.git"

set :deploy_to, "/var/www/island"
set :branch, "main"

set :linked_files, fetch(:linked_files, []).push("config/master.key", "config/database.yml")

set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system")

set :keep_releases, 5

