class Post < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: "User"
  belongs_to :destroyer, class_name: "User", optional: true

  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors
end


