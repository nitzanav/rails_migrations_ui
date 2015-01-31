module MigrationsUiConfig

  def self.all_envs
    ActiveRecord::Base.configurations.keys
  end

end

