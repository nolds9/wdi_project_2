class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  	@lessons = @course.lessons.order(:tag)

    @registered = false
    if !current_user.nil? && !current_user.courses.nil?
      @registered = current_user.courses.include?(@course)
    end

    @users = @course.users.order('created_at desc').first(10)

  end

  private

end
