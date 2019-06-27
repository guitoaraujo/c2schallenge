class CreateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :inputs do |t|
      t.string :name
      t.string :phone
      t.text :message
      t.string :vehicle
      t.decimal :price
      t.string :link
      t.string :vehicle_brand
      t.string :vehicle_model
      t.decimal :km
      t.text :accessories

      t.timestamps
    end
  end
end
