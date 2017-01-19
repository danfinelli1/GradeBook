class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.belongs_to :course

      t.timestamps
    end
  end
end
