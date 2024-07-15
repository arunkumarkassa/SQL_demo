class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :rollnumber
      t.string :standard
      t.date :date_of_birth

      t.timestamps
    end
  end
end
