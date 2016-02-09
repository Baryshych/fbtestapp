class AddFacebookData < ActiveRecord::Migration
  def change
    change_table :users do |t| 
      t.string :name
      t.string :picture
      t.string :facebook_id
      t.text :bio
    end
  end
end
