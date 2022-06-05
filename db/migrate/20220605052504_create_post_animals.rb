class CreatePostAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :post_animals do |t|
      t.text :caption, null: false
      t.integer :user_id, null: false
      

      t.timestamps
    end
  end
end
