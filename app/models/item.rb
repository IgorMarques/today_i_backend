class Item < ApplicationRecord
  def toggle!
    update_attribute(:completed_at, Date.current)
  end

  def done?
    completed_at.present?
  end

  def to_h
    {
      id: id,
      description: description,
      done: done?
    }
  end
end
