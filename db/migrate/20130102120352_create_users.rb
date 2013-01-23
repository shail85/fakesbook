class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_passord
      t.string :password_salt

      t.timestamps
    end
  end
end
