Rails.application.routes.draw do
  get 'flashcard_sets/index'
  get 'flashcard_sets/new'
  get 'flashcard_sets/create'
  get 'flashcard_sets/show'
  get 'flashcard_sets/edit'
  get 'flashcard_sets/update'
  get 'flashcard_sets/destroy'
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers do
    resources :teacher_subjects, only: [:create, :destroy]
    resources :groups
    resources :flashcard_set
    resources :flashcards do
      resources :student_flashcards
    end
    resources :homework
  end
  resources :students do
    resources :student_flashcard_set
    resources :student_flashcards
  end
  resources :topics
end
