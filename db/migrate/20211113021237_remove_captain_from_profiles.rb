class RemoveCaptainFromProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :captain, :string
  end
end
