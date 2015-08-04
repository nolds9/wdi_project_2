class Lesson < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true, length: { maximum: 50 }
  validates :video, presence: true
  validates :tag, presence: true
  validates :course, presence: true

end
