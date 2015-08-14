class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:list]
  def index
    @courses = Course.all
  end

  def show
    # mms: this is a lot of variables for the view.  While it might be necessary, one of Sandi Metz's "rules" is one instance var for a controller action.  How could you get closer to that?
    @course = Course.find(params[:id])
  	@lessons = @course.lessons.order(:tag)

    # mms: I'm feeling a need to call registered? on an object.  Where would you put it?
    @registered = false
    if !current_user.nil? && !current_user.courses.nil?
      @registered = current_user.courses.include?(@course)
    end

    @users = @course.users.order('created_at desc').first(10)

  end

  def list
    if !current_user.nil?
        @courses = current_user.courses
    end
    # mms: what happens if there is no current user?
  end

end
