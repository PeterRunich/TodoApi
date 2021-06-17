Rails.application.routes.draw do
  resources :todos, only: %i[create]

  resources :projects, only: %i[index create] do
    patch 'todo/:todo_id', to: 'todos#update'
  end

  root 'projects#index'
end
