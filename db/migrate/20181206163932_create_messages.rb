class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :nickname
      t.string :content

      t.timestamps
    end
  end
end
