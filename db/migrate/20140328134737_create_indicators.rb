class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :label

      t.timestamps
    end
  end
end
