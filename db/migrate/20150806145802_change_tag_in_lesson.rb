class ChangeTagInLesson < ActiveRecord::Migration
  def change
    change_column :lessons, :tag, 'integer USING CAST(tag AS integer)'
  end
end
