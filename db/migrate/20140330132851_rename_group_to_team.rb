class RenameGroupToTeam < ActiveRecord::Migration
  def change
    rename_table :groups, :teams
  end
end
