class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_profile_path
  end

  def show
    @user = User.find_by_id(current_user.id)
    @student = Student.find_by(user_id:current_user.id)
    @courses = Course.all
    @my_courses = []
  end


private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :user_id)
  end
end
