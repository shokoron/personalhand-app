class CreateDiagnoses < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnoses do |t|
      t.references :user,              null: false, foreign_key: true
      t.boolean :long_fingers,         null: false
      t.boolean :thick_fingers,        null: false
      t.string :finger_shape,          null: false
      t.boolean :webbed_fingers,       null: false
      t.string :ring_type,             default: '', null: true
      t.timestamps
    end
  end
end
