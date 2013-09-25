class DeviseCreateSellers < ActiveRecord::Migration
  def change
    create_table(:sellers) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token

      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.integer :years
      t.string :store
      t.string :logo
      t.string :about
      t.string :bank_code
      t.string :bank
      t.string :bank_branch
      t.string :account

      t.timestamps
    end

    add_index :sellers, :email,                :unique => true
    add_index :sellers, :reset_password_token, :unique => true
    # add_index :sellers, :confirmation_token,   :unique => true
    # add_index :sellers, :unlock_token,         :unique => true
    # add_index :sellers, :authentication_token, :unique => true
  end
end
