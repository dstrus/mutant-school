class AddFieldsToMutant < ActiveRecord::Migration
  def change
    add_column :mutants, :eligibility_begins_at, :datetime
    add_column :mutants, :eligibility_ends_at, :datetime
    add_column :mutants, :may_advise_beginning_at, :datetime
  end
end
