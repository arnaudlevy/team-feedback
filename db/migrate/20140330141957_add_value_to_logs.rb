class AddValueToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :value, :integer
  end
end
