class AddImagecolumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :station, :text
    add_column :jobs, :image, :text
    add_column :jobs, :appeal, :text
  end
end
