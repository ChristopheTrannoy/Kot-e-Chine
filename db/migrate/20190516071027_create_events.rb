class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.text :eventPlace

      t.timestamps
    end
  end
end
