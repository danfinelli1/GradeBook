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

  def show
    if current_user.access_level == "Teacher"
      @assignment = Assignment.find_by_id(params[:assignment_id])
      @list_students = []
      @course = Course.find_by_id(params[:course_id])
      @students = Student.all

      @enrolled = Enrollment.where(course_id:params[:course_id])
      @enrolled_students = []
      #assess the enrollment jointable and returns array of students taking the course
      @enrolled.each do |enroll|
        @enrolled_students.push(Student.where(id:enroll.student_id))
      end
    else
      redirect_to root_path
    end
  end

  def add_student_to_course
    @course = Course.find_by_id(params[:course_id])
    @student_first = params[:enrollment][:student_picked].split(" ").first
    @student_last = params[:enrollment][:student_picked].split(" ").last
    @student = Student.find_by(first_name:@student_first, last_name:@student_last)
    @enrollment = Enrollment.create(course_id:@course.id, student_id:@student.id)
    redirect_to assignment_show_path
  end

  def remove_student_from_course
    @course = Course.find_by_id(params[:course_id])
    @student = Student.find(params[:remove_enrollment][:student_id])
    p params[:remove_enrollment][:student_id]
    @enrollment = Enrollment.delete(course_id:@course.id, student_id:@student.id)
    redirect_to assignment_show_path
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

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_picked)
  end

  def assignment_params
    params.require(:assignment).permit(:name, :course_id)
  end

end
