class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  validate :title_or_link
  validates :deck_id, presence: true
  validates :user_id, presence: true

  before_save :check_for_http

  private
    def title_or_link 
      if title.blank? && link.blank?
        errors.add(:base, "Title and Link can't both be blank.")
      end
    end

    def check_for_http
      if self.link
        unless self.link.include?("http://") || self.link.include?("https://")
          self.link = "http://" + self.link
        end
      end
    end
end
