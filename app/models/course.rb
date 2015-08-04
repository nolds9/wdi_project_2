class Course < ActiveRecord::Base
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }

#paperclip attachment
  has_attached_file :image, :styles => { :medium => "680x300>", :thumb => "170x75>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
