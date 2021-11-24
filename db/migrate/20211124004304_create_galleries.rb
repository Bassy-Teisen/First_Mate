class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.string :description, limit: 500
      t.date :voyage
      t.time :launch

      t.timestamps
    end
  end
end
