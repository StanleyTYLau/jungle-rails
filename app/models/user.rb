class User < ActiveRecord::Base
  has_secure_password

  has_many :review

  validates :password, :password_confirmation, presence: true, length: {minimum: 8}
  validates :email, uniqueness: true

  def self.authenticate_with_credentials(email, password)
    user1 = User.find_by_email(email)
    if user1 && user1.authenticate(password)
      user1
    else
      nil
    end
  end

end
