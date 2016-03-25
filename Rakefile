task :default do
  sh "jsonlint $(find . -name '*.json')"
  sh "./scripts/push_changes.sh"
end
