GenderGuesser::Application.routes.draw do
  
  resources :guess, :only => :index
  match '/guess' => 'guess#make_guess', :via => :post

end
