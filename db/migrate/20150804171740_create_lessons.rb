class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :note
      t.string :video
      t.boolean :header, null: false, default: false
      t.string :tag
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
