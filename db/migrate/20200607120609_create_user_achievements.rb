class CreateUserAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :user_achievements do |t|
      t.integer :user_id
      t.string :achievable_type
      t.integer :achievable_id

      t.timestamps
    end
  end
end
