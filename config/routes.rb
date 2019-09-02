Rails.application.routes.draw do
  root to: 'notifications#show'
  mount ActionCable.server => '/cable'
end