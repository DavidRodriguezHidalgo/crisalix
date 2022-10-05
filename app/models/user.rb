class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  delegate :name, to: :profile
  delegate :address, to: :profile

  before_create :create_profile

  def patient?
    is_a?(Patient)
  end

  def create_profile
    self.profile = Profile.new
  end
end
