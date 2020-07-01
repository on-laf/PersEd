Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers do
    resources :teacher_subjects, only: [:create, :destroy]
    resources :groups
    resources :flashcards do
      resources :student_flashcards
    end
    resources :homework
  end
  resources :flashcard_sets
  resources :students do
    resources :student_flashcard_set
    resources :student_flashcards
    resources :students_groups

  end
  resources :topics
end
