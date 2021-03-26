module Admin::UsersHelper

  def writings_in_month(time_cards, year, month)
    date = DateTime.new(year, month, 1)
    cards = time_cards.where(year: year, month: month)
    previous_total_writings = time_cards.where("in_at < ?", date).order("in_at DESC").first.work_result.writing
    result = 0
    if cards.present?
      cards.each do |card|
        result = card.work_result.writing
      end
      result - previous_total_writings
    else
      0
    end
  end

  def revisions_in_month(time_cards, year, month)
    date = DateTime.new(year, month, 1)
    cards = time_cards.where(year: year, month: month)
    previous_total_revisions = time_cards.where("in_at < ?", date).order("in_at DESC").first.work_result.revision
    result = 0
    if cards.present?
      cards.each do |card|
        result = card.work_result.revision
      end
      result - previous_total_revisions
    else
      0
    end
  end

end
