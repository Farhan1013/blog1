class CommentSearchController < ApplicationController

	skip_before_filter :authorize
	
   def index
   end

   skip_before_filter :authorize

   def find
    #pull the author name from the parameters and use it to search for posts that have comments by the author
    @comments = Comment.where(:'author' => params[:author])
	end
end