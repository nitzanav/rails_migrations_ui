class Migration < Struct.new(:migrations)

  def self.all
    EnvMigration.all.group_by(&:name).values.map { |migrations| new(migrations) }
  end

  delegate :version, :name, :filename, :to => :first

  def first
    migrations.first
  end

  def up
    migrations.select(&:up?)
  end

  def envs_up
    up.map(&:env)
  end

  def up?(env)
    envs_up.include? env
  end

end