class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    login(@teacher)
    redirect_to @teacher
  end

  def show
    @user = User.find_by_id(current_user.id)
  end


private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :password)
  end
end
