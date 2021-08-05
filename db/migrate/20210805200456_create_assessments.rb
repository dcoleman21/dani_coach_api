class CreateAssessments < ActiveRecord::Migration[6.1]
  def change
    create_table :assessments do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.string :assessment_type

      t.timestamps
    end
  end
end
