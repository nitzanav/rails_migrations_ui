require 'ostruct'

class Migration < Struct.new(:version, :name, :filename, :status, :env)

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
