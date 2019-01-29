Notifications::Engine.routes.draw do
  resources :settings, only: [:index, :update], as: :notification_settings

  resources :notifications, path: '' do
    collection do
      delete :clean
    end
  end
end
