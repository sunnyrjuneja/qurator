module DecksHelper
  def title_or_link(card)
    return card.link if card.title.blank?
    return card.title
  end
end
