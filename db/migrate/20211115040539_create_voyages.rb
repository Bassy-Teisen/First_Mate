class CreateVoyages < ActiveRecord::Migration[6.1]
  def change
    create_table :voyages do |t|
      t.string :description, limit: 500
      t.date :voyage

      t.timestamps
    end
  end
end
