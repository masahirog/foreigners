class AddColumnToJobs < ActiveRecord::Migration
  def change
      add_column :jobs, :job_id, :text
  end
end
