class CreateMarks < ActiveRecord::Migration[7.1]
  def change
    create_table :marks do |t|
      t.string :subject
      t.integer :score
      t.string :grade
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
