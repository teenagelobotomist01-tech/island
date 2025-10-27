server "54.203.5.165", user: "deploy", roles: %w{app db web}

set :stage, :production
set :rails_env, "production"

set :ssh_options, {
  user: "deploy",
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

