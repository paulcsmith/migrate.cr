require "db"
require "pg"
require "colorize"
require "../../src/migrate"
require "../../db/migrations/*"

DB_COMMAND = "CREATE DATABASE migrate_cr_dev"
puts "Migrating...".colorize(:cyan)

begin
  Migrate::Runner.new.run_missing_migrations
  puts "✅  Done".colorize(:green)
rescue e : PQ::PQError
  puts e.message.colorize(:red)
end
