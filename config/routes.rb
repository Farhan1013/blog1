Rails.application.routes.draw do
	
  root 'home#index'

  get 'post/index' => 'post#index', as: :post

  get 'post/genesis' => 'post#genesis', as: :genesis

  post 'post/genesis_post' => 'post#genesis_post', as: :genesis_post

  get 'post/one' => 'post#one', as: :one

  post 'post/new_comment' => 'post#new_comment', as: :new_comment

  get 'comment_search/index' => 'comment_search#index', as: :comment_search

  post 'comment_search/find' => 'comment_search#find', as: :find




end
