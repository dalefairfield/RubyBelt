class BrightIdea < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user
  validates :content, presence: true
end
