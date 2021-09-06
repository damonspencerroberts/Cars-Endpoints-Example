class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :color
      t.references :owner

      t.timestamps
    end
  end
end
