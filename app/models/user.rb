class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:user_id]

  has_many :reports

  # No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  # account_security_level の設定
  enum account_level: {
    undefined: 0,
    director: 1,
    client: 2,
    headquarter: 3,
    headquarter_admin: 4,
    manager: 5,
    admin: 6
  }

end
