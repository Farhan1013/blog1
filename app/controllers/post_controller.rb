class PostController < ApplicationController

	def index
	#define a variable named posts
	@posts = Post.all
	end

	def genesis
	@post = Post.new
	end

	def genesis_post
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_path
		else 
			redirect_to @post, notice: 'There was an error creating posts.'
		end
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def one
		@post = Post.find(params[:post])
		@comment = Comment.new
	end

	def new_comment
		@id = params[:post_id]
		@post = Post.find(@id)
		@post.comments << Comment.new(params.require(:comment).permit(:author, :comment))
		if @post.save
			redirect_to one_path(:post => @id)
		end
	end

	def update
		@id = params[:post_id]
		@post = Post.find(@id)
	end

end
