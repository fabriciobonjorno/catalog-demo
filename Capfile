require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/rails/console'
require 'capistrano/bundler'
require 'capistrano/nginx'
require 'capistrano/rvm'

require 'capistrano/puma'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx
install_plugin Capistrano::Puma::Systemd # cap production puma:systemd:config puma:systemd:enable

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }