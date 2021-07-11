on_app_servers_and_utilities do
  run "sed -i '/DD_VERSION/d'  #{config.shared_path}/config/env.cloud"
  run ". #{config.shared_path}/config/env.cloud && echo 'export DD_VERSION=\"#{config.active_revision}\"' >> #{config.shared_path}/config/env.cloud"
  run ". #{config.shared_path}/config/env.cloud && curl -X PUT https://api.engineyard.com/environment_variables/4280 --header \"Content-Type: application/json\" --header \"Accept: application/vnd.engineyard.v3+json\" --data '{ \"environment_variable\": { \"name\": \"DD_VERSION\", \"value\": \"#{config.active_revision}\" } }' --header \"X-EY-TOKEN: $APITOKENEY \""
end
