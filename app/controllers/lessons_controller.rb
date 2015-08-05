class LessonsController < ApplicationController
  def show
    course = Course.find(params[:course_id])
    @lessons = course.lessons.order(:tag)
    @lesson = @lessons.find(params[:id])
  end
end
