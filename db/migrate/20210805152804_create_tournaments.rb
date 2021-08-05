class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :start_date

      t.timestamps
    end
  end
end
