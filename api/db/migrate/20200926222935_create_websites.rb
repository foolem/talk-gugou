class CreateWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :websites do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.integer :stars
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
