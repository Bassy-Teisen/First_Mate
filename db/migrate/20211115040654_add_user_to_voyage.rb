class AddUserToVoyage < ActiveRecord::Migration[6.1]
  def change
    add_reference :voyages, :user, null: false, foreign_key: true
  end
end
