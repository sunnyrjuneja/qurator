class Card < ActiveRecord::Base
  belongs_to :deck

  validate :title_or_link

  private
    def title_or_link 
      if title.blank? && link.blank?
        errors.add(:base, "Title and Link can't both be blank.")
      end
    end
end
