class LessonsController < ApplicationController
  before_action :authenticate_user!
  def show
    course = Course.find(params[:course_id])
    @lessons = course.lessons.order(:tag)
    @lesson = @lessons.find(params[:id])

    registered = false
    if !current_user.nil? && !current_user.courses.nil?
      registered = current_user.courses.include?(course)
    end

    if registered
    @lesson = @lessons.find(params[:id])
    else
      flash[:notice] = "You must register first!"
      redirect_to course
    end
  end
end
