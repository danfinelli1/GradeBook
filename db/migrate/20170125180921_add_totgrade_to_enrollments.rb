class AddTotgradeToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_column :enrollments, :tot_grade, :float, default:0
  end
end
