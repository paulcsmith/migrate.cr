require "./init"

Migrate::Task.run do
  puts "Migrating...".colorize(:cyan)
  Migrate::Runner.new.run_pending_migrations
end
