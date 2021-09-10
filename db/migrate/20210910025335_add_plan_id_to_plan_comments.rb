class AddPlanIdToPlanComments < ActiveRecord::Migration[5.2]
  def change
    add_column :plan_comments, :plan_id, :integer
  end
end
