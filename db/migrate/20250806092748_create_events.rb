class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.string :location
      t.integer :max_participants
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
