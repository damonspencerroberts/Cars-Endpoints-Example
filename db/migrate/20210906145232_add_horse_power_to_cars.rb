class AddHorsePowerToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :horse_power, :integer
  end
end
