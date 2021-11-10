class CreateBoats < ActiveRecord::Migration[6.1]
  def change
    create_table :boats do |t|
      t.string :category, limit: 50
      t.string :size, limit: 50
      t.string :capasity, limit: 50
      t.string :activity, limit: 100

      t.timestamps
    end
  end
end
