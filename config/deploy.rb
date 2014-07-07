require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :rails_env, 'production'
set :domain, '188.226.165.163'
set :port, 5123
set :user, 'apps'
set :term_mode, nil

set :deploy_to, "/home/#{user}/webster/#{rails_env}"
set :app_path, "#{deploy_to}/#{current_path}"
set :repository, 'git@github.com:AvaelKross/webster.git'
set :branch, 'master'
set :shared_paths, ['config/database.yml', 'config/secrets.yml', 'tmp']
set :keep_releases, 10
set :rvm_path, '/home/apps/.rvm/bin/rvm'

task :environment do
  invoke 'rvm:use[ruby-2.1.1@default]'
end

#delay. Setup task
# ==============================================================================
task :setup do
  queue! %{
mkdir -p "#{deploy_to}/shared/tmp/pids"
}
end

# Unicorn
# ==============================================================================
namespace :unicorn do
  set :unicorn_pid, "#{app_path}/tmp/pids/unicorn.pid"
  set :start_unicorn, %{
cd #{app_path}
bundle exec unicorn -c #{app_path}/config/unicorn.rb -E production -D
}

# Start task
# ------------------------------------------------------------------------------
  desc "Start unicorn"
  task :start => :environment do
    queue 'echo "-----> Start Unicorn"'
    queue! start_unicorn
  end

# Stop task
# ------------------------------------------------------------------------------
  desc "Stop unicorn"
  task :stop do
    queue 'echo "-----> Stop Unicorn"'
    queue! %{
test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"` && echo "Stop Ok" && exit 0
echo >&2 "Not running"
}
  end

# Restart task
# ------------------------------------------------------------------------------
  desc "Restart unicorn using 'upgrade'"
  task :restart => :environment do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end

# Deploy task
# ==============================================================================
desc "deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke 'git:clone'
    invoke 'bundle:install'
    invoke 'deploy:link_shared_paths'
    invoke 'rails:db_migrate'
    invoke 'rails:assets_precompile'

    to :launch do
      invoke :'unicorn:restart'
    end
  end
end