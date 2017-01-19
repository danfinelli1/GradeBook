class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    login(@student)
    redirect_to @student
  end

  def show
    @user = User.find_by_id(current_user.id)
  end


private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password)
  end
end
