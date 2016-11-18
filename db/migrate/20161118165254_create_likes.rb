class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :likes
      t.references :user, foreign_key: true
      t.references :bright_idea, foreign_key: true

      t.timestamps
    end
  end
end
