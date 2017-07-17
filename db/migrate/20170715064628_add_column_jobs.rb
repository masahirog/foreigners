class AddColumnJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :content, :text
  end
end
