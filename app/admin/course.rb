ActiveAdmin.register Course do

  permit_params :name, :content, :image

# customize image upload field so its a button
  #explicitly declare columns
  show do |t|
		attributes_table do
			row :name
			row :content
			row :image do
				course.image? ? image_tag(course.image.url, height: '100') : content_tag(:span, "No Photo Yet")
			end
		end
	end
  # explicitly customize fields
	form :html => {:multipart => true} do |f|
		f.inputs do
			f.input :name
			f.input :content
			f.input :image, hint: f.course.image? ?  image_tag(course.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
		end
		f.actions
	end



end
