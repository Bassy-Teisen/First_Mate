class AddDescriptionToAppliedVoyage < ActiveRecord::Migration[6.1]
  def change
    add_column :applied_voyages, :description, :string, limit: 500
  end
end
