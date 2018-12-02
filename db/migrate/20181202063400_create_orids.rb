class CreateOrids < ActiveRecord::Migration[5.2]
  def change
    create_table :orids do |t|
      t.text :o
      t.text :r
      t.text :i
      t.text :d
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
