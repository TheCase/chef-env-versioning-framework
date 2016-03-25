current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "client"
client_key               "#{current_dir}/client.pem"
validation_client_name   "ht-test-validator"
validation_key           "#{current_dir}/validator.pem"
chef_server_url          "https://api.chef.io/organizations/org"
