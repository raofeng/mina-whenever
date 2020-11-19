set :whenever_environment_variable, -> { fetch(:environment_variable) || 'RAILS_ENV' }
set :whenever_environment, -> { fetch(fetch(:environment_variable).downcase.to_sym) }
set :whenever_name, -> { "#{fetch(:application_name)}_#{fetch(:rails_env)}" }

namespace :whenever do
  desc 'Clear crontab'
  task clear: :remote_environment do
    comment "Clear contrab for #{fetch(:whenever_name)}"
    in_path fetch(:current_path) do
      command "#{fetch(:whenever_environment_variable)}=#{fetch(:rails_env)} #{fetch(:bundle_bin)} exec whenever --clear-crontab #{fetch(:whenever_name)}"
    end
  end

  desc 'Update crontab'
  task update: :remote_environment do
    comment "Update crontab for #{fetch(:whenever_name)}"
    in_path fetch(:current_path) do
      command "#{fetch(:whenever_environment_variable)}=#{fetch(:rails_env)} #{fetch(:bundle_bin)} exec whenever --update-crontab #{fetch(:whenever_name)}"
    end
  end

  desc 'Write crontab'
  task write: :remote_environment do
    comment "Write crontab for #{fetch(:whenever_name)}"
    in_path fetch(:current_path) do
      command "#{fetch(:whenever_environment_variable)}=#{fetch(:rails_env)} #{fetch(:bundle_bin)} exec whenever --write-crontab #{fetch(:whenever_name)}"
    end
  end
end
