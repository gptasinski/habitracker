class User < ActiveRecord::Base

  has_secure_password

  has_many :smoker_stats
  has_many :swim_stats

end
