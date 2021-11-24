class AddVoyageToGallery < ActiveRecord::Migration[6.1]
  def change
    add_reference :galleries, :voyage, null: false, foreign_key: true
  end
end
