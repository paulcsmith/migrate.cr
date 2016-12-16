require "db"
require "pg"
require "colorize"
require "../../src/migrate"
require "../../../../db/migrations/*"

class Migrate::Task
  def self.run
    raise "Requires a database name given as first option" if ARGV.first?.nil?
    Migrate::Runner.db_name = ARGV.first
    yield
    puts "✅  Done".colorize(:green)
  rescue e : PQ::PQError
    puts e.message.colorize(:red)
  rescue e
    puts e.inspect_with_backtrace
  end
end
