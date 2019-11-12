Rails.application.routes.draw do
  root to: 'questionnaires#show'

  devise_for :users

  get 'groups/show'

  get 'questionnaires/show'
  post 'questionnaires/update'
  delete 'questionnaires/destroy'
end
