class Post < ApplicationRecord
  validates_presence_of :title, :body

  def published
    !published_at.nil?
  end

  def published=(value)
    pub = value.to_i != 0
    if published
      self.published_at = nil if !pub
      return
    end
    self.published_at = DateTime.now if pub
  end

end
