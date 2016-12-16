class CreateUsers::V001 < Migrate::Migration
  def migrate
    # create users
  end

  def rollback
    # drop users
  end
end
