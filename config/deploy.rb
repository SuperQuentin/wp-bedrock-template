# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

############################################
## Application configuration
############################################

set :application, "wp-bedrock-template"
set :repo_url, "git@github.com:SuperQuentin/wp-bedrock-template.git"
set :pty, true

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

############################################
## Capistrano configuration
############################################

set :log_level, :info
set :keep_releases, 5
set :deploy_to, -> { "/var/www/#{fetch(:application)}" }
set :ssh_options, { forward_agent: true }

SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"

namespace :deploy do
  after :starting, 'composer:install_executable'
end