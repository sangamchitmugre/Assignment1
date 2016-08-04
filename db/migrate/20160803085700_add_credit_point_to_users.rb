class AddCreditPointToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :credit_point, :integer, default: 1000
  end
end
