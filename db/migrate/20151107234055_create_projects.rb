class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :expectedDate
      t.string :situation, default: "To-Do"

      t.timestamps null: false
    end
  end
end
