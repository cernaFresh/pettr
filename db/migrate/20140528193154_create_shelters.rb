class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :shelter_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
