class CoursesController < ApplicationController
  before_action :find_course, only: [:show]
  def index
    @courses = Course.all
  end

  def show
    @lessons = @course.lessons
  end

  private
  def find_course
    @course = Course.find(params[:id])

  end

end
