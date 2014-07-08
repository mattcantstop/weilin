Weilin::Application.routes.draw do

  resources :users do
    resources :wars
  end

  resources :wars do
    resources :battles
    resources :participants
  end

  post 'wars/:id/join' => 'wars#join'
  get 'wars/:id/show_with_participants_and_battles' => 'wars#show_with_participants_and_battles'

end
