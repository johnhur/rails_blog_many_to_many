class Post < ActiveRecord::Base

	validates :title, :content, :author, presence: true

	has_many :post_tags, dependent: :destroy
	has_many :tags, through: :post_tags
end
