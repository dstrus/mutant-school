Rails.application.routes.draw do
  apipie
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :mutants, except: [:new, :edit] do
        resources :enrollments, except: [:new, :edit, :update]
        resources :advisees, only: [:index, :create, :destroy]
      end
      resources :terms, except: [:new, :edit] do
        resources :enrollments, except: [:new, :edit, :update]
      end
    end
  end
end
