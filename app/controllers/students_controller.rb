class StudentsController < ApplicationController

  def index
    @students = Student.all
    redirect_to student_profile_path
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_profile_path
  end

  def show
    @enrolled_course = []
    @user = User.find_by_id(current_user.id)
    @student = Student.find_by(user_id:current_user.id)
    @enrollment = Enrollment.where(student_id:@student.id)
    @enrollment.each do |enroll|
      @enrolled_course.push(Course.find(enroll.course_id))
    end
  end

  def course_show
    @student = Student.find_by(user_id:current_user.id)
    @course = Course.find(params[:course_id])
    @assignments = Assignment.where(course_id:params[:course_id])
  end

  def edit
    @student = Student.find_by(user_id:current_user.id)
  end

  def update
    @student = Student.find_by_id(current_user.id)
    @student = Student.find_by(user_id:current_user.id)
    @student.update_attributes(student_params)
    redirect_to student_profile_path
  end


private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :user_id)
  end
end
