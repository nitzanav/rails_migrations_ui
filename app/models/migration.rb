class Migration < ActiveRecord::Base

  def self.all_envs
    [:development, :test, :production]
  end

  def envs
    [:development, :test]
  end

  def migrated?(env)
    envs.include? env
  end

end
