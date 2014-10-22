class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
