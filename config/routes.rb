Rails.application.routes.draw do
  root to: 'site#index'

#user routes
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

#teacher routes
  get '/teacher/profile', to: 'teachers#show', as: 'teacher_profile'
  get '/teacher/new', to: 'teachers#new', as: 'new_teacher'
  post '/teacher', to: 'teachers#create'
  get '/teacher/edit', to: 'teachers#edit', as: 'edit_teacher'
  patch '/teacher/edit', to: 'teachers#update'

#student routes
  get '/student/profile', to: 'students#show', as: 'student_profile'
  get '/student/new', to: 'students#new', as: 'new_student'
  post '/student', to: 'students#create'
  get '/student/edit', to: 'students#edit', as: 'edit_student'
  patch '/student/edit', to: 'students#update'
  get '/student/:student_id/course/:course_id', to: 'students#course_show', as: 'student_show_course'

#session routes
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

#course routes
  get '/course/new', to: 'courses#new', as: 'new_course'
  post '/course', to: 'courses#create'
  get '/course/:id', to: 'courses#show', as: 'course_show'
  get '/course/:id/edit', to: 'courses#edit', as: 'edit_course'
  put '/course/:id/edit', to: 'courses#update'
  delete '/course/:id/destroy', to: 'courses#destroy', as: 'delete_course'
  delete '/course/:id', to: 'courses#remove_student_from_course', as: 'destroy_enrollment'
  post '/course/:id', to: 'courses#add_student_to_course', as: 'create_enrollment'

#assignment routes
  get '/course/:id/assignment/new', to: 'assignments#new', as: 'new_assignment'
  post '/assignment', to: 'assignments#create'
  get '/course/:course_id/assignment/:assignment_id', to: 'assignments#show', as: 'assignment_show'
  get '/course/:course_id/assignment/:assignment_id/edit', to: 'assignments#edit', as: 'edit_assignment'
  put '/course/:course_id/assignment/:assignment_id/edit', to: 'assignments#update'
  delete '/course/:course_id/assignment/:assignment_id/destroy', to: 'assignments#destroy', as: 'delete_assignment'

#grade routes
  post '/course/:course_id/assignment/:assignment_id/grade/:student_id', to: 'assignments#add_grade_to_student', as: 'grade_assignment'

end
