class AddPublicToOrid < ActiveRecord::Migration[5.2]
  def change
    add_column :orids, :public, :boolean
  end
end
