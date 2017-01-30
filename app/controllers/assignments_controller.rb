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
    # TODO: GET A LIST OF YOUR STUDENTS THEN LOAD EACH STUDENT WITH THE APPROPRIATE GRADE HERE!!! NO DB CALLS IN YOUR VIEWS!
    if current_user.access_level == "Teacher"
      @assignment = Assignment.find_by_id(params[:assignment_id])
      @course = Course.find_by_id(params[:course_id])
      @students = Student.all

      # TODO: Can you roll lines 24 to 28 into a method helper and put it in yoru model or model helper file? The ideal is to have a very small controller codebase and a bigger model codebase. This makes reading the controller faster and easier.
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
    @course = Course.find_by_id(@assignment.course_id)

    if @user.access_level == "Teacher"
      redirect_to course_show_path(@assignment.course_id)
    elsif @user.access_level == "Student"
      redirect_to new_student_path
    else
      redirect_to root_path
    end
  end

  def edit
    @course = Course.find_by_id(params[:course_id])
    @assignment = Assignment.find_by_id(params[:assignment_id])
    @teacher = Teacher.find_by(user_id:current_user.id)
  end

  def update
    if current_user.access_level == "Teacher"
      updated_assignment = Assignment.find_by_id(params[:assignment_id])
      if updated_assignment.update(assignment_params)
          redirect_to assignment_show_path(params[:course_id], params[:assignment_id])
      else
          redirect_to edit_assigment_path
      end
    else
      redirect_to student_profile_path
    end
  end

  def destroy
    if current_user.access_level == "Teacher"
      deleted_assignment = Assignment.find_by_id(params[:assignment_id])
      Assignment.destroy(deleted_assignment)
      redirect_to teacher_profile_path
    else
      redirect_to student_profile_path
    end
  end

  def add_grade_to_student
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:assignment_id])
    @student = Student.find(params[:add_grade][:student_id])
    @course_grade = Enrollment.find_by(course_id:params[:course_id], student_id:params[:add_grade][:student_id])
    @course_grade.update_attributes(tot_grade: @course_grade.tot_grade.to_i + params[:add_grade][:grade].to_i)
    @add_grade = Grade.create(grade:params[:add_grade][:grade], assignment_id:@assignment.id, student_id:@student.id)
    redirect_to assignment_show_path(course_id:@course.id, assignment_id:@assignment.id)
  end

private
  def grades_params
    params.require(:grade).permit(:grade, :assignment_id, :student_id)
  end

  def assignment_params
    params.require(:assignment).permit(:name, :course_id)
  end

end
