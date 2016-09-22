class Post < ActiveRecord::Base
    has_many :author_posts
    has_many :authors, :through => :author_posts
     
    accepts_nested_attributes_for :authors
end