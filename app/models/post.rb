class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title,
            :presence => true,
            :uniqueness => true
  validates :text,
            :presence => true

  default_scope order("created_at DESC")

  def recent_commenters
    self.comments.recent(5).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
  end

  def self.popular
    all.collect{|p| p if p.comments.length > 10}.compact
  end

  def to_params
    "#{id}-#{title.parameterize}"
  end
end

