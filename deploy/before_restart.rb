on_app_servers_and_utilities do
  run "sed -i '/DD_VERSION/d'  #{config.shared_path}/config/env.cloud"
  run ". #{config.shared_path}/config/env.cloud && echo 'export DD_VERSION=\"#{config.active_revision}\"' >> /data/ruby3_quiz/shared/config/env.cloud"
end
