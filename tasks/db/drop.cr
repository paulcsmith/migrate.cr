require "db"
require "pg"
require "colorize"

DB_COMMAND = "DROP DATABASE migrate_cr_dev"
puts "Dropping database with: #{DB_COMMAND.colorize(:cyan)}"

begin
  DB.open("postgres://localhost") do |db|
    db.exec DB_COMMAND
  end
  puts "✅  Done".colorize(:green)
rescue e : PQ::PQError
  puts e.message.colorize(:red)
end
