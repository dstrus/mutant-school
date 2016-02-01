class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :mutant, index: true, foreign_key: true
      t.references :term, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
