class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    if current_user.access_level == "Teacher"
      @course = Course.new
      @teacher = Teacher.find_by(user_id:current_user.id)
    else
      redirect_to root_path
    end
  end

  def create
    @course = Course.create(course_params)
    redirect_to teacher_profile_path
  end

  def show
    @course = Course.find_by_id(params[:id])
    @assignments = Assignment.where(course_id:@course.id)
  end

private

  def course_params
    params.require(:course).permit(:name, :number, :teacher_id)
  end
end
