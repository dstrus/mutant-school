class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :mutant_name
      t.string :power
      t.string :real_name

      t.timestamps null: false
    end
  end
end
