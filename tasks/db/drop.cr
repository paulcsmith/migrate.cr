require "./init"

Migrate::Task.run do
  db_command = "DROP DATABASE #{ARGV.first}"
  puts "Dropping database with: #{db_command.colorize(:cyan)}"

  DB.open("postgres://localhost") do |db|
    db.exec db_command
  end
end
