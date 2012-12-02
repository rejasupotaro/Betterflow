set :output, "/path/to/log/cron.log"

every 1.day do
  runner "BatchUpdate.execute"
end
