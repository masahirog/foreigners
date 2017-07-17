class AddRateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :text
    add_column :jobs, :url, :text
    add_column :jobs, :subtitle, :text
    add_column :jobs, :pay, :text
    add_column :jobs, :erea, :text
  end
end
