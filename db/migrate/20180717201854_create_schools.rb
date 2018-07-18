class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :type
      t.date :founding_year

      t.timestamps
    end
  end
end
