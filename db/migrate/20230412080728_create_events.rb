class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :entry_fees
      t.datetime :starting_time
      t.timestamps
    end
  end
end
