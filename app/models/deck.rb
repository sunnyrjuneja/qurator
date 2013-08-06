class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :delete_all
  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
end
