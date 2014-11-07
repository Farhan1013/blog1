class Post
	#sweet mixin giving our object database capabilities
	 include Mongoid::Document
	field :title, type: String
  	field :body, type: String
  	has_many :comments
end
