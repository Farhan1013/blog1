class PostsController < ApplicationController

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
		@post = Post.find(params[:id])
		if @post.update_attributes(params.require(:post).permit(:body))
			redirect_to post_path(:post_id => params[:id]) 
		else
			redirect_to @post, notice: "There was an error saving your post"
		end
	end

    def edit
		@post = Post.find(params[:id])

    end

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def destroy
		@post = Post.find(params[:post])
		@post.destroy
		redirect_to post_path, notice: "this post was deleted"
	end

	def comment
		@id = params[:post_id]
		@comments = Comment.where(:'post_id' => params[:post_id])
	end
end
