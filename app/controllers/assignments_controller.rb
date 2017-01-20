class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def new
    if current_user.access_level == "Teacher"
      @assignment = Assignment.new
      @teacher = Teacher.find_by(user_id:current_user.id)
      @course = Course.find_by_id(params[:id])
    else
      redirect_to root_path
    end
  end

  def create
    @user = current_user
    @assignment = Assignment.create(assignment_params)
    @course = Course.find_by_id(params[:id])
    if @user.access_level == "Teacher"
      redirect_to teacher_profile_path
    elsif @user.access_level == "Student"
      redirect_to new_student_path
    else
      redirect_to root_path
    end
  end
private
  def assignment_params
    params.require(:assignment).permit(:name, :course_id)
  end

end
