class User < ActiveRecord::Base

  has_secure_password
  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.where("email = '#{email}'")

    if (user && (BCrypt::Password.new(user[0][:password_digest])) == password)
      return user
    else
      return nil
    end
  end

end
