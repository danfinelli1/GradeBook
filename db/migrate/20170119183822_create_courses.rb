class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :number
      t.belongs_to :teacher

      t.timestamps
    end
  end
end
