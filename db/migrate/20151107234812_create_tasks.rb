class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :project, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
