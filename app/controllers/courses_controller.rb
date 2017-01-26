class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    if current_user.access_level == "Teacher"
      @course = Course.new
      @teacher = Teacher.find_by(user_id:current_user.id)
    else
      redirect_to root_path
    end
  end

  def create
    @course = Course.create(course_params)
    redirect_to teacher_profile_path
  end

  def show
    if current_user.access_level == "Teacher"
      @list_students = []
      @course = Course.find_by_id(params[:id])
      @assignments = Assignment.where(course_id:@course.id)
      @students = Student.all
      #accesses the enrollment jointable and returns array of students taking the course
      @enrolled = Enrollment.where(course_id:params[:id])
      @enrolled_students = []
      @enrolled.each do |enroll|
        @enrolled_students.push(Student.where(id:enroll.student_id))
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @course = Course.find_by_id(params[:id])
    @teacher = Teacher.find_by(user_id:current_user.id)
  end

  def update
    if current_user.access_level == "Teacher"
      updated_course = Course.find_by_id(params[:id])
      if updated_course.update(course_params)
          redirect_to course_show_path(params[:id])
      else
          redirect_to edit_course_path
      end
    else
      redirect_to student_profile_path
    end
  end

  def destroy
    if current_user.access_level == "Teacher"
      deleted_course = Course.find_by_id(params[:id])
      Course.destroy(deleted_course)
      redirect_to teacher_profile_path
    else
      redirect_to student_profile_path
    end
  end

  def remove_student_from_course
    @course = Course.find_by_id(params[:id])
    @student = Student.find(params[:remove_enrollment][:student_id])
    @enrollment = Enrollment.find_by(course_id:params[:id], student_id:@student.id)
    Enrollment.delete(@enrollment)
    redirect_to course_show_path(@course.id)
  end

  def add_student_to_course
    @course = Course.find_by_id(params[:id])
    @student_first = params[:enrollment][:student_picked].split(" ").first
    @student_last = params[:enrollment][:student_picked].split(" ").last
    @student = Student.find_by(first_name:@student_first, last_name:@student_last)
    @enrollment = Enrollment.create(course_id:@course.id, student_id:@student.id)
    redirect_to course_show_path(@course.id)
  end

private

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end

  def course_params
    params.require(:course).permit(:name, :number, :teacher_id)
  end
end
