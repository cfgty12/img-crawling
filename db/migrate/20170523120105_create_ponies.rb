class CreatePonies < ActiveRecord::Migration
  def change
    create_table :ponies do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
