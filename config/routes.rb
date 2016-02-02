Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :mutants, except: [:new, :edit] do
        resources :enrollments, except: [:new, :edit, :update]
      end
      resources :terms, except: [:new, :edit] do
        resources :enrollments, except: [:new, :edit, :update]
      end
    end
  end
end
