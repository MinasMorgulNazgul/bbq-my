class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.strind :address
      t.datetime :datetime

      t.timestamps
    end
  end
end