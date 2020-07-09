Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers do
    resources :teacher_subjects, only: [:create, :destroy]
  end
  resources :groups
  resources :flashcard_homeworks do
    member do
      get :flop_send
      # get :flop_draft
    end
  end
  resources :flashcard_sets do
    resources :flashcard_templates
  end
  resources :students do
    resources :students_groups
  end
  resources :topics
  resources :student_flashcard_sets do
    resources :student_flashcards do
      member do
        patch :add_feedback
      end
    end
    member do
      get :flop_submit
    end
  end
end
