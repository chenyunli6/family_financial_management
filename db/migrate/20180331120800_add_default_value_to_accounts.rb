class AddDefaultValueToAccounts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :accounts, :general_income, 0
    change_column_default :accounts, :general_expenses, 0
    change_column_default :accounts, :other_income, 0
    change_column_default :accounts, :other_expenses, 0
  end
end
