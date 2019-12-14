class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.string :section
      t.string :url
      t.string :image_url
      t.string :tags, array: true, default: [].to_yaml
      t.timestamps
    end
  end
end
