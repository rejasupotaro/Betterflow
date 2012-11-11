class ChangeReleaseDateType < ActiveRecord::Migration
  def change
    change_column :tracks, :release_date, :string
  end

  def up
  end

  def down
  end
end
