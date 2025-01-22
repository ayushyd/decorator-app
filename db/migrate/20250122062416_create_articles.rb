class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.references :category, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
