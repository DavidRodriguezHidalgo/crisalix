class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  def patient?
    is_a?(Patient)
  end
end
