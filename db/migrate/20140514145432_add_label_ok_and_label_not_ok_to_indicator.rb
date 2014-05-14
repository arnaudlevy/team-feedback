class AddLabelOkAndLabelNotOkToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :label_ok, :string
    add_column :indicators, :label_not_ok, :string
  end
end
