class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images
end
