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
      @course = Course.find_by_id(params[:course_id])
      @students = Student.all

      #accesses the enrollment jointable and returns array of students taking the course
      @enrolled = Enrollment.where(course_id:params[:course_id])
      @enrolled_students = []
      @enrolled.each do |enroll|
        @enrolled_students.push(Student.where(id:enroll.student_id))
      end
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

  def add_grade_to_student
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:assignment_id])
    @student = Student.find(params[:add_grade][:student_id])
    @add_grade = Grade.create(grade:params[:add_grade][:grade], assignment_id:@assignment.id, student_id:@student.id)
    redirect_to assignment_show_path
  end

private
  def grades_params
    params.require(:grade).permit(:grade, :assignment_id, :student_id)
  end

  def assignment_params
    params.require(:assignment).permit(:name, :course_id)
  end

end
