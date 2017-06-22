class AddRateToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :sex, :integer
    add_column :subscribes, :birth_date, :date
    add_column :subscribes, :nationality, :string

  end
end
