class User < ActiveRecord::Base
  has_one :address
  has_many :posts

  deligate :city, :country, :to => :address

  acts_as_authentic

  def to_s
    "#{user_name}"
  end
end

