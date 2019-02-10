class User < ApplicationRecord
  before_save :set_ip

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def set_ip
    self.ip = request.remote_ip
  end
end
