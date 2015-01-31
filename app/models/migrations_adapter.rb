class MigrationsAdapter

  def self.read
    MigrationsUiConfig.all_envs.flat_map{ |env| read_env(env) }
  end

  def self.read_env env
    output = JSON.parse(run_rake(env, 'db:migrate:status_json'))
    return [] if output.is_a?(Hash) && output["Error"].present?

    output.map{ |migration| migration.merge(env: env) }
  end

  def self.run_rake(env, task_name)
    ENV['RAILS_ENV'] = env.to_s
    `rake #{task_name}`
  end

end