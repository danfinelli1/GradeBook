Rails.application.routes.draw do
  root to: 'site#index'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/teacher/profile', to: 'teachers#show', as: 'teacher_profile'
  get '/student/profile', to: 'students#show', as: 'student_profile'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'


end
