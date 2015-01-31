require "struct_initialize_by_hash"

class EnvMigration < Struct.new(:version, :name, :filename, :status, :env)

  def self.all
    initialize_by_hash MigrationsAdapter.read
  end

  def up?
    status == 'up'
  end

  def down?
    status == 'down'
  end

end
