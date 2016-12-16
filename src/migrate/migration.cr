require "colorize"
require "./*"

abstract class Migrate::Migration
  macro inherited
    Migrate::Runner.migrations << self

    def version
      get_version_from_filename
    end

    macro get_version_from_filename
      {{@type.name.split("::").last.gsub(/V/, "")}}
    end
  end

  abstract def migrate
  abstract def version

  def up
    if migrated?
      puts "Already migrated #{self.class.name}"
    else
      # migrate
      # track_migration
      # puts "Migrated #{self.class.name.colorize(:green)}"
    end
  end

  private def migrated?
    DB.open("postgres://localhost/migrate_cr_dev") do |db|
      result = db.query_one? "SELECT id FROM migrations WHERE version = ?", version, as: Int32
      puts result.inspect
    end
  end
end
