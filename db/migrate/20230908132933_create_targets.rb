class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.belongs_to :offer, null: false, foreign_key: true
      t.integer :min_age, null: false
      t.integer :max_age, null: false
      t.string :genders, array: true, default: []

      t.timestamps
    end
    add_index :targets, [:offer_id, :min_age, :max_age, :genders], unique: true
  end
end
