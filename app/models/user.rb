class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :user_profile

  class << self
    def from_omniauth(omniauth_hash)
      user = find_or_initialize_by(email: omniauth_hash['info']['email'])
      unless user.persisted?
        user.password = SecureRandom.hex 
      end
      return user
    end # .from_omniauth
  end # class << self
end
