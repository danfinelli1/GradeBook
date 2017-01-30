class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # TODO: Do a check for errors and send a flash message if there are errors
    UserMailer.welcome_email(@user).deliver_now
    login(@user)
    if @user.access_level == "Teacher"
      redirect_to new_teacher_path
    elsif @user.access_level == "Student"
      redirect_to new_student_path
    end

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    delete_user = User.find_by_id(current_user.id)
    User.destroy(delete_user)
    redirect_to root_path
  end


private

  def user_params
    params.require(:user).permit(:email, :password, :access_level)
  end
end
