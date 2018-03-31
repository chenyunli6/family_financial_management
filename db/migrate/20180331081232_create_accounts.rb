class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.decimal :general_income
      t.decimal :general_expenses
      t.decimal :other_income
      t.decimal :other_expenses
      t.string :label
      t.string :memo
      t.references :user

      t.timestamps
    end
  end
end
