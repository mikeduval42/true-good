class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :resident
      t.boolean :volunteer
      t.boolean :corporation
      t.string :phone_number
      t.boolean :reference
      t.string :reference_contact
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :background_check

      t.timestamps
    end
  end
end
