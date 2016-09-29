class User < ActiveRecord::Base

  has_secure_password
  has_many :smoker_stats
  has_many :swim_stats
  has_many :ped_stats

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true



end
