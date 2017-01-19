class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.belongs_to :course
      t.belongs_to :student

      t.timestamps
    end
  end
end
