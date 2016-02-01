class AddAdvisorIdToMutant < ActiveRecord::Migration
  def change
    add_column :mutants, :advisor_id, :integer, index: true
  end
end
