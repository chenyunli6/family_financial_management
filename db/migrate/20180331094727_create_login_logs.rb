class CreateLoginLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :login_logs do |t|
      t.datetime :login_time
      t.string :ip_address
      t.references :user
      t.timestamps
    end
  end
end
