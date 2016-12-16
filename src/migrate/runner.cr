require "db"
require "pg"
require "colorize"

class Migrate::Runner
  @@migrations = [] of Migrate::Migration.class

  def self.migrations
    @@migrations
  end

  def run_missing_migrations
    setup_migration_tracking_tables
    @@migrations.each do |migration|
      puts migration.new.version.colorize(:yellow)
      migration.new.up
    end
  end

  def setup_migration_tracking_tables
    DB.open("postgres://localhost/migrate_cr_dev") do |db|
      db.exec create_table_for_tracking_migrations
    end
  end

  def create_table_for_tracking_migrations
    <<-SQL
    CREATE TABLE IF NOT EXISTS migrations (
      id serial PRIMARY KEY,
      version int NOT NULL
    )
    SQL
  end
end
