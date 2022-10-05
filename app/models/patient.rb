class Patient < User
  devise :registerable,
         :recoverable, :rememberable, :validatable

  has_many :images
  has_many :appointments
  validates_length_of :images, maximum: 3
end