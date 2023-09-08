class CreateUserOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_offers do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :offer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_offers, [:user_id, :offer_id], unique: true
  end
end
