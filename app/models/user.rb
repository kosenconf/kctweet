class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :icon, :presence => true

  has_many :tweets

  scope :activated,   where(:activated => true)
  scope :inactivated, where(:activated => false)

  def self.create_with_omniauth(auth)
    create! do |user|
      p auth
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.name     = auth["user_info"]["nickname"]
      user.icon     = auth["user_info"]["image"]
    end
  end
end
