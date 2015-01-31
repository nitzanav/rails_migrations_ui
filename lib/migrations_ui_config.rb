module MigrationsUiConfig

  def self.all_envs
    [:development] #ActiveRecord::Base.configurations.keys
  end

end

