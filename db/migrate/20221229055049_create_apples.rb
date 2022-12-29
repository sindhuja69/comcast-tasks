class CreateApples < ActiveRecord::Migration[7.0]
  def change
    create_table :apples do |t|
      t.integer :basket_id
      t.string :variety
      t.timestamps
    end
  end
end
