class CreateStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :styles do |t|
      t.decimal :wholesale_price
      t.decimal :retail_price
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
