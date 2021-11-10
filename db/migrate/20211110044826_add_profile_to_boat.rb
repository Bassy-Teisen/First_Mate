class AddProfileToBoat < ActiveRecord::Migration[6.1]
  def change
    add_reference :boats, :profile, null: false, foreign_key: true
  end
end
