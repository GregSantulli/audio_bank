class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, password_length: 6..128
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates_confirmation_of :password

end
