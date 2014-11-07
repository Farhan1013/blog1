Rails.application.routes.draw do
	
  root 'home#index'

  get 'posts/index' => 'posts#index', as: :post

  get 'posts/genesis' => 'posts#genesis', as: :genesis

  post 'posts/genesis_post' => 'posts#genesis_post', as: :genesis_post

  get 'posts/one' => 'posts#one', as: :one

  post 'posts/new_comment' => 'posts#new_comment'

  get 'comment_search/index' => 'comment_search#index', as: :comment_search

  post 'comment_search/find' => 'comment_search#find', as: :find

  get    'posts/:id/edit' =>  'posts#edit',     as: :edit_post

  patch  'posts/:id' =>       'posts#update'

  delete "posts/:post" => 'posts#destroy', as: :delete_post

  get 'posts/comment' => 'posts#comment', as: :comment





end
