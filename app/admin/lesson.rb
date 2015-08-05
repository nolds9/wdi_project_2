ActiveAdmin.register Lesson do

  permit_params :title, :note, :video, :header, :tag, :course_id

# Drag and drop admin with sortable tree
  # config
  sortable tree: false,
            sorting_attribute: :tag

  index :as => :sortable do
    label :title

    actions
  end

  # customize table
  index do
    selectable_column
      column :header
      column :title
      column :tag
      column :course

      actions
  end
end
