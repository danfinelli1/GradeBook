class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    # TODO: Do a check for errors and send a flash message if there are errors
    redirect_to teacher_profile_path
  end

  def show
    @user = User.find_by_id(current_user.id)
    @teacher = Teacher.find_by(user_id:current_user.id)
    @courses = Course.where(teacher_id:@teacher.id)
  end

  def edit
    @teacher = Teacher.find_by(user_id:current_user.id)
  end

  def update
    @user = User.find_by_id(current_user.id)
    @teacher = Teacher.find_by(user_id:current_user.id)
    @teacher.update_attributes(teacher_params)
    redirect_to teacher_profile_path
  end


private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :user_id)
  end
end
