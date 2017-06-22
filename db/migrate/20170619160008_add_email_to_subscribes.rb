class AddEmailToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :email, :string
    add_column :subscribes, :telephone, :integer
    add_column :subscribes, :address, :string
    add_column :subscribes, :lang_level, :string
    add_column :subscribes, :job, :string
    add_column :subscribes, :comment, :text
  end
end
