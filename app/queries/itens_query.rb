class ItensQuery
  def self.retrieve(completed_at: nil)
    return Item.where(completed_at: nil) unless completed_at

    Item.where(completed_at: completed_at.beginning_of_day..completed_at.end_of_day)
  end
end
