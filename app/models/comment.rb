class Comment < ActiveRecord::Base
  belongs_to :user


  def commenter_address
    "#{self.user.city},#{self.user.country}"
  end

  default_scope order("created_at DESC")

  def self.recent(count)
    limit(count)
  end

  def is_minimum_length?
    self.text.length >= 4
  end
end

