class Patient < User
  devise :registerable,
         :recoverable, :rememberable, :validatable
end