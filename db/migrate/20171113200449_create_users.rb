class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    # The schema:
    # - username
    # - email
    # - password
    # - nonce
    # - activated
    # - activation_code
    # - password_reset_token
    # - locked
    # - role

    create_table :users do |t|
      t.string :username, limit: 200
      t.string :email, limit: 254
      t.string :hash, limit: 60
      t.string :nonce, limit: 36
      t.integer :activated, limit: 1, unsigned: true, default: 0
      t.string :activation_code, limit: 36
      t.string :password_reset, limit: 36
      t.integer :locked, limit: 1, unsigned: true, default: 0
      t.column :role, "ENUM('user', 'moderator', 'admin')", default: 'user'
    end
  end
end
