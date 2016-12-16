require "./init"

Migrate::Task.run do
  puts "Rolling back...".colorize(:cyan)
  Migrate::Runner.new.rollback_all
end
