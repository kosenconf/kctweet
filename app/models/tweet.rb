class Tweet < ActiveRecord::Base
  validates :message, :presence => true, :length => { :in => 1..140 }

  belongs_to :user
end
