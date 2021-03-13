class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.timestamps
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.string :username, null: false, default: ""
      t.integer :user_role, :limit => 1, :comment => '1:admin, 2:user', default: 2
      t.string :created_by
      t.string :updated_by
      t.string :deleted_by
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :deleted_at
    end
  end
end
