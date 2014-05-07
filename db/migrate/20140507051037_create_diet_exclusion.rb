class CreateDietExclusion < ActiveRecord::Migration
  def change
    create_table :diet_exclusions do |t|
      t.string  :type
      t.integer :user_id
    end
  end
end
