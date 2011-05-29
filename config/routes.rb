CrazyController::Application.routes.draw do
  resources :conflict_creations

  match 'conflict_creations/create_conflict' => 'conflict_creations#create_conflict'
end
