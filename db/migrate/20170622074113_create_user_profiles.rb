class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :city
      t.string :zipcode
      t.attachment :image
      t.references :user

      t.timestamps
    end
  end
end
