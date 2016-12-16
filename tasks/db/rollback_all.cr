require "./init"

Migrate::Task.run do
  puts "Rolling back all migrations...".colorize(:cyan)
  Migrate::Runner.new.rollback_all
end
