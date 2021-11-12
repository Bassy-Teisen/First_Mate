class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, limit: 50
      t.string :phone_number, limit: 15
      t.boolean :captain
      t.text :description, limit: 1000
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
