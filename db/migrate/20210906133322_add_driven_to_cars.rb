class AddDrivenToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :driven, :boolean, default: false
  end
end
