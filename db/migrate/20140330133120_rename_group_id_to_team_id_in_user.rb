class RenameGroupIdToTeamIdInUser < ActiveRecord::Migration
  def change
    rename_column :users, :group_id, :team_id
  end
end
