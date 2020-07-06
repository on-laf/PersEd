Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers do
    resources :teacher_subjects, only: [:create, :destroy]
  end
  resources :groups
  resources :flashcard_homeworks
  resources :flashcard_sets do
    resources :flashcard_templates do
      resources :student_flashcards
    end
  end
  resources :students do
    resources :student_flashcard_sets
    resources :student_flashcards
    resources :students_groups

  end
  resources :topics
end
