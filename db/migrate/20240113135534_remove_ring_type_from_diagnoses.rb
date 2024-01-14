class RemoveRingTypeFromDiagnoses < ActiveRecord::Migration[7.0]
  def change
    remove_column :diagnoses, :ring_type
  end
end
