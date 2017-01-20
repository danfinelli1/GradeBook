class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :user

      t.timestamps
    end
  end
end
