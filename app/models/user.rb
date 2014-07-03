class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_token

  def accept
    self.update_column(:reg_token, nil)
    self.update_column(:accepted, true)
  end

  protected

    def generate_token
      self.reg_token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless self.class.exists?(reg_token: random_token)
      end
    end
end
