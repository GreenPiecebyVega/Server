class CreateUserBans < ActiveRecord::Migration[7.0]
  def change
    create_table :user_bans do |t|
      t.references :user, null: false, foreing_key: true, index: true

      t.integer :category
      t.datetime :expiry_date
      t.text :description

      t.timestamps null: false
    end
  end
end
