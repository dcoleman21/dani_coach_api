class ChangeColumnDefaultOnPlayersRecruit < ActiveRecord::Migration[6.1]
  def change
    change_column_default :players, :recruit, true
  end
end
