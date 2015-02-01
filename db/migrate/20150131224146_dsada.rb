klass = Class.new(ActiveRecord::Migration) do

  def up
    ActiveRecord::Base.connection.execute "SELECT 1"
  end

end

Object.const_set "Dsada", klass