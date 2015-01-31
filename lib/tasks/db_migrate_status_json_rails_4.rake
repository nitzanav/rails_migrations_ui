namespace :db do
  namespace :migrate do

    desc 'Display status of migrations in json, like db:migrate:status'
    task :status_json => [:environment, :load_config] do
      unless ActiveRecord::Base.connection.table_exists?(ActiveRecord::Migrator.schema_migrations_table_name)
        puts 'Schema migrations table does not exist yet.'
        next  # means "return" for rake task
      end
      db_list = ActiveRecord::Base.connection.select_values("SELECT version FROM #{ActiveRecord::Migrator.schema_migrations_table_name}")

      file_list =
          ActiveRecord::Migrator.migrations_paths.flat_map do |path|
            # match "20091231235959_some_name.rb" and "001_some_name.rb" pattern
            Dir.foreach(path).grep(/^(\d{3,})_(.+)\.rb$/) do
              version = $1
              status = db_list.delete(version) ? 'up' : 'down'

              {  filename: file,
                 status: status,
                 version: version,
                 name: $2 }
            end
          end

      db_list.map! { |version| {  status: 'up', version: version } }

      db_list + file_list
    end
  end
end
