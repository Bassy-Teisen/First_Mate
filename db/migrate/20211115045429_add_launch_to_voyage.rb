class AddLaunchToVoyage < ActiveRecord::Migration[6.1]
  def change
    add_column :voyages, :launch, :time
  end
end
