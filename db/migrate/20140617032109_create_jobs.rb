class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :time_preference
      t.string :tools
      t.string :type_of_work
      t.string :duration
      t.boolean :recurring
      t.string :location
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
