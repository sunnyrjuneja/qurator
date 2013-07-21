class Deck < ActiveRecord::Base
  has_many :cards, dependent: :delete_all
  validates :name, presence: true
end
