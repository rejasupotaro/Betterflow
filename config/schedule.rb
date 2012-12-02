set :output, Whenever.path + "/log/cron.log"

every 1.day, :at => '4:05 am' do
  runner "BatchUpdate.execute"
end
