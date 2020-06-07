class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :name
      t.decimal :required_steps, precision: 15, scale: 0

      t.timestamps
    end
  end
end
