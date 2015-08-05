class RegistrationsController < ApplicationController

  before_action :authenticate_user!

  def register
    @course = Course.find(params[:course_id])
    current_user.registrations.create(course: @course)

    redirect_to @course
  end

end
