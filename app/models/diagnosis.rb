class Diagnosis < ApplicationRecord
  belongs_to :user

  validates :long_fingers, inclusion: { in: [true, false] }
  validates :thick_fingers, inclusion: { in: [true, false] }
  validates :webbed_fingers, inclusion: { in: [true, false] }

  enum finger_shape: { conical: 'conical', jointed: 'jointed' }, _suffix: true
  enum ring_type: { straight: 'straight', wave: 'wave', v_shape: 'v_shape' }, _suffix: true

  validates :finger_shape, presence: true, inclusion: { in: finger_shapes.keys }
  validates :ring_type, presence: true, inclusion: { in: ring_types.keys }
end
