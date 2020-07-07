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
    resources :flashcard_templates
  end
  resources :students do
    resources :students_groups
  end
  resources :topics
  resources :student_flashcard_sets do
    resources :student_flashcards
  end

  mount Blazer::Engine, at: "blazer"
end
