Rails.application.routes.draw do

  root to: 'issues#index', as: 'index'

  post '/events', to: 'issues#create', as: 'create_event'

  get '/issues/events', to: 'issues#search_issue', as: 'search_issue'
end
