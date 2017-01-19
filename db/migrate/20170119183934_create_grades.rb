class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.float :grade
      t.belongs_to :assignment
      t.belongs_to :student

      t.timestamps
    end
  end
end
