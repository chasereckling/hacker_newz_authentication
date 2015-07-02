class Post < ActiveRecord::Base
  has_many :comments
  validates :title, :presence => true
  validates :url, :presence => true
  validates :author, :presence => true
end
