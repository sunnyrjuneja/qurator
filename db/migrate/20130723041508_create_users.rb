class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :token
      t.string :secret
      t.text :image
      t.string :remember_token

      t.timestamps
    end
  end
end
