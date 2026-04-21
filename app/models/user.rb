class User < ApplicationRecord
    has_many :post, dependent: :destroy
    has_many :created_posts, class_name: "Post", foreign_key: "creator_id" 
    has_many :destroyed_posts, class_name: "Post", foreign_key: "destroyer"
end
