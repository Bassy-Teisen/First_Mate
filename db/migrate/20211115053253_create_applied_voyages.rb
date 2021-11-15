class CreateAppliedVoyages < ActiveRecord::Migration[6.1]
  def change
    create_table :applied_voyages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :voyage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
