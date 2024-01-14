class Diagnosis < ApplicationRecord
  belongs_to :user

  validates :long_fingers, :thick_fingers, :webbed_fingers, inclusion: { in: [true, false] }
  validates :finger_shape, presence: true, inclusion: { in: %w[conical jointed] }
end

