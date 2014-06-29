# config valid only for Capistrano 3.1
lock '3.2.1'

# setup multistage
set :stages, %w(testing production)
set :default_stage, "production"
set :application, "TrueFinisher"
set :repository, "git@github.com:jfalkson/TrueFinisher.git"
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "ec2-user"
set :deploy_to, "/var/www/TrueFinisher"
desc "check production task"
task :check_production do
if stage.to_s == "production"
puts " \n Are you REALLY sure you want to deploy to production?"
puts " \n Enter the password to continue\n "
password = STDIN.gets[0..7] rescue nil
if password != 'mypasswd'
puts "\n !!! WRONG PASSWORD !!!"
exit
end
end
end
role :web, "ec2-54-191-1-44.us-west-2.compute.amazonaws.com" # Your HTTP server, Apache/etc
role :app, "ec2-54-191-1-44.us-west-2.compute.amazonaws.com" # This may be the same as your `Web` server
role :db, "ec2-54-191-1-44.us-west-2.compute.amazonaws.com", :primary => true # This is where Rails migrations will run
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
task :start do ; end
task :stop do ; end
task :restart, :roles => :app, :except => { :no_release => true } do
run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
end
end
before "deploy", "check_production"