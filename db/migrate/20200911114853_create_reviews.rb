class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
