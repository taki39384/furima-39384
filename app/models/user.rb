class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must be alphanumeric and include at least one letter and one number" }
  validates :password_confirmation, presence: true
  validate :password_match
  
  private
  def password_match
    errors.add(:password_confirmation, "doesn't match Password") if password != password_confirmation
  end
end
