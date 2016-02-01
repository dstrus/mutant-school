class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.datetime :begins_at
      t.datetime :ends_at

      t.timestamps null: false
    end
  end
end
