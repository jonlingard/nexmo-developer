Rails.application.routes.draw do
  namespace :admin do
    resources :events
    resources :sessions
    root to: 'events#index'
  end

  get 'markdown/show'

  get '/tutorials', to: 'tutorials#index'
  get '/tutorials/*document', to: 'tutorials#show'
  get '/*product/tutorials', to: 'tutorials#index'

  get '/documentation', to: 'static#documentation'

  get '/contribute', to: 'static#contribute'
  get '/contribute/styleguide', to: 'static#styleguide'
  get '/contribute/write-the-docs', to: 'static#write_the_docs'

  get '/tools', to: 'static#tools'
  get '/community', to: 'static#community'
  get '/community/past-events', to: 'static#past_events'

  get '/changelog', to: 'changelog#index'
  get '/changelog/:version', to: 'changelog#show', constraints: { version: /\d\.\d\.\d/ }

  match '/search', to: 'search#results', via: [:get, :post]
  match '/quicksearch', to: 'search#quicksearch', via: [:get, :post]

  get '/api', to: 'api#index'
  get '/api/*document', to: 'api#show'

  get '/*product/api-reference', to: 'markdown#api'
  get '/:product/*document', to: 'markdown#show', constraints: DocumentationConstraint.new

  get '/robots.txt', to: 'static#robots'

  get '*unmatched_route', to: 'application#not_found'

  root 'static#landing'
end
