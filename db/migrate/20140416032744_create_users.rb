class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :picture_url
      t.string :uid
      t.boolean :active

      t.timestamps
    end
  end
end
