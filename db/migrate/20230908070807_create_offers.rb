class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :description, null: false
      t.string :image

      t.timestamps
    end
    add_index :offers, :description, unique: true
  end
end
