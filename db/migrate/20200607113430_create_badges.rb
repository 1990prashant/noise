class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :required_level

      t.timestamps
    end
  end
end
