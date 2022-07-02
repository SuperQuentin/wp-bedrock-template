set :branch, 'main'
set :stage, :production
set :env_file, ".env_#{:stage}"

# Server IP or domain name to deploy to
server "test.quentin-aellen.ch",
  user: "deploy", 
  roles: %w{app db web},
  ssh_options: {
    keys: %w(~/.ssh/id_rsa),
    auth_methods: %w(publickey)
  }

# Uncomment the following to override the default deploy folder path
# set :deploy_to, -> { "/var/www/wordpress" }
